/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.15.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionConnect;
    QAction *actionExot;
    QWidget *centralwidget;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_2;
    QLineEdit *lnClientName;
    QComboBox *cmbStatus;
    QListWidget *lstMessages;
    QGridLayout *gridLayout;
    QLabel *label;
    QLineEdit *lnMessage;
    QPushButton *btnSend;
    QPushButton *btnSendFile;
    QLabel *label_2;
    QComboBox *cmbDestination;
    QMenuBar *menubar;
    QMenu *menuOptions;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(363, 296);
        actionConnect = new QAction(MainWindow);
        actionConnect->setObjectName(QString::fromUtf8("actionConnect"));
        actionExot = new QAction(MainWindow);
        actionExot->setObjectName(QString::fromUtf8("actionExot"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        centralwidget->setEnabled(false);
        verticalLayout = new QVBoxLayout(centralwidget);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        lnClientName = new QLineEdit(centralwidget);
        lnClientName->setObjectName(QString::fromUtf8("lnClientName"));

        horizontalLayout_2->addWidget(lnClientName);

        cmbStatus = new QComboBox(centralwidget);
        cmbStatus->addItem(QString());
        cmbStatus->addItem(QString());
        cmbStatus->addItem(QString());
        cmbStatus->addItem(QString());
        cmbStatus->setObjectName(QString::fromUtf8("cmbStatus"));

        horizontalLayout_2->addWidget(cmbStatus);


        verticalLayout->addLayout(horizontalLayout_2);

        lstMessages = new QListWidget(centralwidget);
        lstMessages->setObjectName(QString::fromUtf8("lstMessages"));

        verticalLayout->addWidget(lstMessages);

        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout->addWidget(label, 1, 0, 1, 1);

        lnMessage = new QLineEdit(centralwidget);
        lnMessage->setObjectName(QString::fromUtf8("lnMessage"));

        gridLayout->addWidget(lnMessage, 1, 1, 1, 2);

        btnSend = new QPushButton(centralwidget);
        btnSend->setObjectName(QString::fromUtf8("btnSend"));

        gridLayout->addWidget(btnSend, 1, 3, 1, 1);

        btnSendFile = new QPushButton(centralwidget);
        btnSendFile->setObjectName(QString::fromUtf8("btnSendFile"));
        btnSendFile->setMaximumSize(QSize(35, 16777215));

        gridLayout->addWidget(btnSendFile, 1, 4, 1, 1);

        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        gridLayout->addWidget(label_2, 0, 0, 1, 1);

        cmbDestination = new QComboBox(centralwidget);
        cmbDestination->addItem(QString());
        cmbDestination->addItem(QString());
        cmbDestination->setObjectName(QString::fromUtf8("cmbDestination"));

        gridLayout->addWidget(cmbDestination, 0, 1, 1, 2);


        verticalLayout->addLayout(gridLayout);

        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 363, 22));
        menuOptions = new QMenu(menubar);
        menuOptions->setObjectName(QString::fromUtf8("menuOptions"));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);

        menubar->addAction(menuOptions->menuAction());
        menuOptions->addAction(actionConnect);
        menuOptions->addSeparator();
        menuOptions->addAction(actionExot);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "Client", nullptr));
        actionConnect->setText(QCoreApplication::translate("MainWindow", "Connect", nullptr));
        actionExot->setText(QCoreApplication::translate("MainWindow", "Exit", nullptr));
        lnClientName->setPlaceholderText(QCoreApplication::translate("MainWindow", "Enter Client Name", nullptr));
        cmbStatus->setItemText(0, QCoreApplication::translate("MainWindow", "None", nullptr));
        cmbStatus->setItemText(1, QCoreApplication::translate("MainWindow", "Available", nullptr));
        cmbStatus->setItemText(2, QCoreApplication::translate("MainWindow", "Away", nullptr));
        cmbStatus->setItemText(3, QCoreApplication::translate("MainWindow", "Busy", nullptr));

        label->setText(QCoreApplication::translate("MainWindow", "Message:", nullptr));
        btnSend->setText(QCoreApplication::translate("MainWindow", "Send", nullptr));
        btnSendFile->setText(QCoreApplication::translate("MainWindow", "...", nullptr));
        label_2->setText(QCoreApplication::translate("MainWindow", "Desitnation:", nullptr));
        cmbDestination->setItemText(0, QCoreApplication::translate("MainWindow", "Server", nullptr));
        cmbDestination->setItemText(1, QCoreApplication::translate("MainWindow", "All", nullptr));

        menuOptions->setTitle(QCoreApplication::translate("MainWindow", "Options", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
