/****************************************************************************
** Meta object code from reading C++ file 'ClientManager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "ClientManager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ClientManager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ClientManager_t {
    QByteArrayData data[15];
    char stringdata0[162];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ClientManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ClientManager_t qt_meta_stringdata_ClientManager = {
    {
QT_MOC_LITERAL(0, 0, 13), // "ClientManager"
QT_MOC_LITERAL(1, 14, 9), // "connected"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 12), // "disconnected"
QT_MOC_LITERAL(4, 38, 19), // "textMessageReceived"
QT_MOC_LITERAL(5, 58, 7), // "message"
QT_MOC_LITERAL(6, 66, 8), // "receiver"
QT_MOC_LITERAL(7, 75, 8), // "isTyping"
QT_MOC_LITERAL(8, 84, 11), // "nameChanged"
QT_MOC_LITERAL(9, 96, 8), // "prevName"
QT_MOC_LITERAL(10, 105, 4), // "name"
QT_MOC_LITERAL(11, 110, 13), // "statusChanged"
QT_MOC_LITERAL(12, 124, 20), // "ChatProtocol::Status"
QT_MOC_LITERAL(13, 145, 6), // "status"
QT_MOC_LITERAL(14, 152, 9) // "readyRead"

    },
    "ClientManager\0connected\0\0disconnected\0"
    "textMessageReceived\0message\0receiver\0"
    "isTyping\0nameChanged\0prevName\0name\0"
    "statusChanged\0ChatProtocol::Status\0"
    "status\0readyRead"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ClientManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x06 /* Public */,
       3,    0,   50,    2, 0x06 /* Public */,
       4,    2,   51,    2, 0x06 /* Public */,
       7,    0,   56,    2, 0x06 /* Public */,
       8,    2,   57,    2, 0x06 /* Public */,
      11,    1,   62,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      14,    0,   65,    2, 0x08 /* Private */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    5,    6,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    9,   10,
    QMetaType::Void, 0x80000000 | 12,   13,

 // slots: parameters
    QMetaType::Void,

       0        // eod
};

void ClientManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ClientManager *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->connected(); break;
        case 1: _t->disconnected(); break;
        case 2: _t->textMessageReceived((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 3: _t->isTyping(); break;
        case 4: _t->nameChanged((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 5: _t->statusChanged((*reinterpret_cast< ChatProtocol::Status(*)>(_a[1]))); break;
        case 6: _t->readyRead(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ClientManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ClientManager::connected)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ClientManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ClientManager::disconnected)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ClientManager::*)(QString , QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ClientManager::textMessageReceived)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ClientManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ClientManager::isTyping)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ClientManager::*)(QString , QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ClientManager::nameChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ClientManager::*)(ChatProtocol::Status );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ClientManager::statusChanged)) {
                *result = 5;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ClientManager::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ClientManager.data,
    qt_meta_data_ClientManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ClientManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ClientManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ClientManager.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ClientManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void ClientManager::connected()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void ClientManager::disconnected()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ClientManager::textMessageReceived(QString _t1, QString _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ClientManager::isTyping()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ClientManager::nameChanged(QString _t1, QString _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ClientManager::statusChanged(ChatProtocol::Status _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
