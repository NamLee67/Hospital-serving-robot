#ifndef LIGHTCONTROLLER_H
#define LIGHTCONTROLLER_H

#include <QObject>

#define PIN_LEFTLIGHT   18
#define PIN_RIGHTLIGHT  17
#define HIGH    1
#define LOW     0

class lightcontroller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool leftLightState READ leftLightState  NOTIFY leftLightStateChanged)
    Q_PROPERTY(bool rightLightState READ rightLightState  NOTIFY rightLightStateChanged)
public:
    explicit lightcontroller(QObject *parent = nullptr);

    bool leftLightState() const{
        return m_leftLightState;
    }
    bool rightLightState() const{
        return m_rightLightState;
    }
public slots:
    void toggleLeftLight(bool state);
    void toggleRightLight(bool state);
signals:
    void leftLightStateChanged();
    void rightLightStateChanged();
private:
    bool m_leftLightState;
    bool m_rightLightState;

};



#endif // LIGHTCONTROLLER_H
