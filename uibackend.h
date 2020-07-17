#ifndef UIBACKEND_H
#define UIBACKEND_H

#include <QObject>
#include <QQmlEngine>
#include <QVector>
#include <QtMqtt/QtMqtt>

class UiBackEnd : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString val_1 READ getVal_1 NOTIFY valChanged_1)
    Q_PROPERTY(QString val_2 READ getVal_2 NOTIFY valChanged_2)
    Q_PROPERTY(QString val_3 READ getVal_3 NOTIFY valChanged_3)
    Q_PROPERTY(QString val_4 READ getVal_4 NOTIFY valChanged_4)

    Q_PROPERTY(QString average_1 READ getAverage_1 NOTIFY averageChanged_1)
    Q_PROPERTY(QString average_2 READ getAverage_2 NOTIFY averageChanged_2)
    Q_PROPERTY(QString average_3 READ getAverage_3 NOTIFY averageChanged_3)
    Q_PROPERTY(QString average_4 READ getAverage_4 NOTIFY averageChanged_4)

    Q_PROPERTY(QList<int> last_vals_1 READ getLastVals_1 NOTIFY lastValsChanged_1)
    Q_PROPERTY(QList<int> last_vals_2 READ getLastVals_2 NOTIFY lastValsChanged_2)
    Q_PROPERTY(QList<int> last_vals_3 READ getLastVals_3 NOTIFY lastValsChanged_3)
    Q_PROPERTY(QList<int> last_vals_4 READ getLastVals_4 NOTIFY lastValsChanged_4)

    Q_PROPERTY(QString max_1 READ getMax_1 NOTIFY maxChanged_1)
    Q_PROPERTY(QString max_2 READ getMax_2 NOTIFY maxChanged_2)
    Q_PROPERTY(QString max_3 READ getMax_3 NOTIFY maxChanged_3)
    Q_PROPERTY(QString max_4 READ getMax_4 NOTIFY maxChanged_4)

    Q_PROPERTY(QString min_1 READ getMin_1 NOTIFY minChanged_1)
    Q_PROPERTY(QString min_2 READ getMin_2 NOTIFY minChanged_2)
    Q_PROPERTY(QString min_3 READ getMin_3 NOTIFY minChanged_3)
    Q_PROPERTY(QString min_4 READ getMin_4 NOTIFY minChanged_4)

public:
    explicit UiBackEnd(QObject *parent = nullptr);

    QString getVal_1();
    QString getVal_2();
    QString getVal_3();
    QString getVal_4();

    QString getAverage_1();
    QString getAverage_2();
    QString getAverage_3();
    QString getAverage_4();

    QList<int> getLastVals_1();
    QList<int> getLastVals_2();
    QList<int> getLastVals_3();
    QList<int> getLastVals_4();

    QString getMax_1();
    QString getMax_2();
    QString getMax_3();
    QString getMax_4();

    QString getMin_1();
    QString getMin_2();
    QString getMin_3();
    QString getMin_4();

signals:
    void valChanged_1();
    void valChanged_2();
    void valChanged_3();
    void valChanged_4();

    void averageChanged_1();
    void averageChanged_2();
    void averageChanged_3();
    void averageChanged_4();

    void lastValsChanged_1();
    void lastValsChanged_2();
    void lastValsChanged_3();
    void lastValsChanged_4();

    void maxChanged_1();
    void maxChanged_2();
    void maxChanged_3();
    void maxChanged_4();

    void minChanged_1();
    void minChanged_2();
    void minChanged_3();
    void minChanged_4();

public slots:
    void updateMessage(const QMqttMessage &msg);

private:
    QString m_val_1;
    QString m_val_2;
    QString m_val_3;
    QString m_val_4;

    QString m_average_1;
    QString m_average_2;
    QString m_average_3;
    QString m_average_4;

    int n_measurements_1;
    int n_measurements_2;
    int n_measurements_3;
    int n_measurements_4;

    QList<int> m_last_vals_1;
    QList<int> m_last_vals_2;
    QList<int> m_last_vals_3;
    QList<int> m_last_vals_4;

    QString m_max_1;
    QString m_max_2;
    QString m_max_3;
    QString m_max_4;

    QString m_min_1;
    QString m_min_2;
    QString m_min_3;
    QString m_min_4;
};

#endif // UIBACKEND_H
