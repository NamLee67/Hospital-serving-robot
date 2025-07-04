//#include <wiringPi.h>
#include "lightcontroller.h"

lightcontroller::lightcontroller(QObject *parent) : QObject(parent), m_leftLightState(false), m_rightLightState(false)
{
//    wiringPiSetupGpio();
//    pinMode(PIN_LEFTLIGHT, OUTPUT);
//    pinMode(PIN_RIGHTLIGHT, OUTPUT);
//    digitalWrite(PIN_LEFTLIGHT, LOW);
//    digitalWrite(PIN_RIGHTLIGHT, LOW);

}

void lightcontroller :: toggleLeftLight(bool state){
//    m_leftLightState = state;
//    digitalWrite(PIN_LEFTLIGHT, state ? HIGH : LOW);
    emit leftLightStateChanged();
}

void lightcontroller :: toggleRightLight(bool state){
//    m_rightLightState = state;
//    digitalWrite(PIN_RIGHTLIGHT, state ? HIGH : LOW);
    emit rightLightStateChanged();
}
