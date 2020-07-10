#include "uibackend.h"
#include <iostream>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>

#include <QtMqtt/QMqttTopicFilter>

#include <mosquitto.h> // Gotta change the compiler options on this

UiBackEnd::UiBackEnd(QObject *parent) : QObject(parent)
{

    /* <1> Connect to the database and query
     * for averages, etc. Last 5 values... etc
     */


    // Connecting to the database.
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");

    db.setHostName("ls-a18ac929467e0be09e95abb6b724a2714400bf66.c0xebatpnexb.ap-southeast-2.rds.amazonaws.com");
    db.setDatabaseName("IoTMatterport");
    db.setUserName("dbmasteruser");
    db.setPassword(".^0Z<a7a`_<fyb{.3(Y%p|1Vcl0O&fay");

    if(db.open()) {
        qDebug() << "Database Connected: " << db.hostName();
    } else {
        qDebug() << "Database Connection FAILED";
    }

    QSqlQuery query;

    // Get the average value from the database.
    query.exec("SELECT AVG(Measurement) FROM device_1_Measurements");
    if(query.next()) {
        m_average_1 = query.value(0).toString();
        qDebug() << "Device 1 - Average:" << m_average_1;
    }

    // Get the number of measurements from the database
    query.exec("SELECT COUNT(*) FROM device_1_Measurements");
    if(query.next()) {
        n_measurements_1 = query.value(0).toInt();
        qDebug() << "Device 1 - Number of Measurements:" << n_measurements_1;
    }

    // Get the starting value
    bool first_val = true;
    int count_vals = 1;
    query.exec("SELECT Measurement FROM device_1_Measurements ORDER BY id DESC LIMIT 6");
    while(query.next()) {
        if(first_val) {
            m_val_1 = query.value(0).toString();
            first_val = false;
            qDebug() << "Device 1 - Starting Number:" << m_val_1;
            continue;
        }
        QString lastVal = query.value(0).toString();
        m_last_vals_1.push_back(query.value(0).toInt());
        qDebug() << "Device 1 - Last Val:" << lastVal << count_vals;
        count_vals++;
    }
    first_val = true;
    count_vals = 1;

    query.exec("SELECT AVG(Measurement) FROM device_2_Measurements");
    if(query.next()) {
        m_average_2 = query.value(0).toString();
        qDebug() << "Device 2 - Average:" << m_average_2;
    }
    query.exec("SELECT COUNT(*) FROM device_2_Measurements");
    if(query.next()) {
        n_measurements_2 = query.value(0).toInt();
        qDebug() << "Device 2 - Number of Measurements:" << n_measurements_2;
    }
    query.exec("SELECT Measurement FROM device_2_Measurements ORDER BY id DESC LIMIT 6");
    while(query.next()) {
        if(first_val) {
            m_val_2 = query.value(0).toString();
            first_val = false;
            qDebug() << "Device 2 - Starting Number:" << m_val_2;
            continue;
        }
        QString lastVal = query.value(0).toString();
        m_last_vals_2.push_back(query.value(0).toInt());
        qDebug() << "Device 2 - Last Val:" << lastVal << count_vals;
        count_vals++;
    }
    first_val = true;
    count_vals = 1;

    query.exec("SELECT AVG(Measurement) FROM device_3_Measurements");
    if(query.next()) {
        m_average_3 = query.value(0).toString();
        qDebug() << "Device 3 - Average:" << m_average_3;
    }
    query.exec("SELECT COUNT(*) FROM device_3_Measurements");
    if(query.next()) {
        n_measurements_3 = query.value(0).toInt();
        qDebug() << "Device 3 - Number of Measurements:" << n_measurements_3;
    }
    query.exec("SELECT Measurement FROM device_3_Measurements ORDER BY id DESC LIMIT 6");
    while(query.next()) {
        if(first_val) {
            m_val_3 = query.value(0).toString();
            first_val = false;
            qDebug() << "Device 3 - Starting Number:" << m_val_3;
            continue;
        }
        QString lastVal = query.value(0).toString();
        m_last_vals_3.push_back(query.value(0).toInt());
        qDebug() << "Device 3 - Last Val:" << lastVal << count_vals;
        count_vals++;
    }
    first_val = true;
    count_vals = 1;

    query.exec("SELECT AVG(Measurement) FROM device_4_Measurements");
    if(query.next()) {
        m_average_4 = query.value(0).toString();
        qDebug() << "Device 4 - Average:" << m_average_4;
    }
    query.exec("SELECT COUNT(*) FROM device_4_Measurements");
    if(query.next()) {
        n_measurements_4 = query.value(0).toInt();
        qDebug() << "Device 4 - Number of Measurements:" << n_measurements_4;
    }
    query.exec("SELECT Measurement FROM device_4_Measurements ORDER BY id DESC LIMIT 6");
    while(query.next()) {
        if(first_val) {
            m_val_4 = query.value(0).toString();
            first_val = false;
            qDebug() << "Device 4 - Starting Number:" << m_val_4;
            continue;
        }
        QString lastVal = query.value(0).toString();
        m_last_vals_4.push_back(query.value(0).toInt());
        qDebug() << "Device 4 - Last Val:" << lastVal << count_vals;
        count_vals++;
    }
    first_val = true;
    count_vals = 1;

    /* <2> Get new MQTT values and recalc the average and update last vals
     */

    QMqttClient *m_client = new QMqttClient(this);
    m_client->setHostname("localhost");
    m_client->setPort(1883);

    /* MQTT module consists of Asyncronous Programming
     * connectToHost is a non-blocking process. Therefore need to use event statuses to get this working
     */

    connect(m_client, &QMqttClient::connected, this, [m_client, this] {
        QMqttSubscription *subscription = m_client->subscribe(QString("/#"), 0);
        subscription = m_client->subscribe(QString("/#"), 0);
        if(!subscription) {
            qDebug() << "Unable to subscribe";
            // exit ?
        } else {
            qDebug() << "MQTT Subscribed!";
            connect(subscription, &QMqttSubscription::messageReceived, this, &UiBackEnd::updateMessage);
        }
    });

    m_client->connectToHost();
}


void UiBackEnd::updateMessage(const QMqttMessage &msg) {

    QString topic_name = msg.topic().name();
    if(topic_name == "/device_1") {
        qDebug() << "Received Msg For Device_1";
        m_val_1 = msg.payload();
        emit valChanged_1();

        m_last_vals_1.push_front(m_val_1.toInt());
        m_last_vals_1.pop_back();
        emit lastValsChanged_1();

        n_measurements_1++;
        m_average_1 = QString::number(((m_average_1.toFloat() * (n_measurements_1 - 1)) + m_val_1.toFloat()) / static_cast<float>(n_measurements_1));
        emit averageChanged_1();
    } else if(topic_name == "/device_2"){
        m_val_2 = msg.payload();
        emit valChanged_2();

        m_last_vals_2.push_front(m_val_2.toInt());
        m_last_vals_2.pop_back();
        emit lastValsChanged_2();

        n_measurements_2++;
        m_average_2 = QString::number(((m_average_2.toFloat() * (n_measurements_2 - 1)) + m_val_2.toFloat()) / static_cast<float>(n_measurements_2));
        emit averageChanged_2();
    } else if(topic_name == "/device_3") {
        m_val_3 = msg.payload();
        emit valChanged_3();

        m_last_vals_3.push_front(m_val_3.toInt());
        m_last_vals_3.pop_back();
        emit lastValsChanged_3();

        n_measurements_3++;
        m_average_3 = QString::number(((m_average_3.toFloat() * (n_measurements_3 - 1)) + m_val_3.toFloat()) / static_cast<float>(n_measurements_3));
        emit averageChanged_3();
    } else if(topic_name == "/device_4") {
        m_val_4 = msg.payload();
        emit valChanged_4();

        m_last_vals_4.push_front(m_val_4.toInt());
        m_last_vals_4.pop_back();
        emit lastValsChanged_4();

        n_measurements_4++;
        m_average_4 = QString::number(((m_average_4.toFloat() * (n_measurements_4 - 1)) + m_val_4.toFloat()) / static_cast<float>(n_measurements_4));
        emit averageChanged_4();
    } else {
        qDebug() << "Topic Not Found!";
    }

    //emit valChanged_2();
    //emit valChanged_3();
    //emit valChanged_4();
    qDebug() << "Received a message" << msg.payload() << m_average_1;
}


QString UiBackEnd::getAverage_1() {
    return m_average_1;
}

QString UiBackEnd::getAverage_2() {
    return m_average_2;
}

QString UiBackEnd::getAverage_3() {
    return m_average_3;
}

QString UiBackEnd::getAverage_4() {
    return m_average_4;
}


QString UiBackEnd::getVal_1() {
    return m_val_1;
}

QString UiBackEnd::getVal_2() {
    return m_val_2;
}

QString UiBackEnd::getVal_3() {
    return m_val_3;
}

QString UiBackEnd::getVal_4() {
    return m_val_4;
}

QList<int> UiBackEnd::getLastVals_1() {
    return m_last_vals_1;
}

QList<int> UiBackEnd::getLastVals_2() {
    return m_last_vals_2;
}

QList<int> UiBackEnd::getLastVals_3() {
    return m_last_vals_3;
}

QList<int> UiBackEnd::getLastVals_4() {
    return m_last_vals_4;
}
