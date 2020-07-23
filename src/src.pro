ADS_OUT_ROOT = $${OUT_PWD}/..
CONFIG += c++14
CONFIG += debug_and_release
TARGET = $$qtLibraryTarget(qtadvanceddocking)
TEMPLATE = lib
DESTDIR = $${ADS_OUT_ROOT}/lib
QT += core gui widgets

!adsBuildStatic {
	CONFIG += shared
    DEFINES += ADS_SHARED_EXPORT
}
adsBuildStatic {
	CONFIG += staticlib
    DEFINES += ADS_STATIC
}

windows {
	# MinGW
	*-g++* {
		QMAKE_CXXFLAGS += -Wall -Wextra -pedantic
	}
	# MSVC
	*-msvc* {
	}
}

RESOURCES += ads.qrc

HEADERS += \
    ads_globals.h \
    DockAreaWidget.h \
    DockAreaTabBar.h \
    DockContainerWidget.h \
    DockManager.h \
    DockWidget.h \
    DockWidgetTab.h \ 
    DockingStateReader.h \
    FloatingDockContainer.h \
    FloatingDragPreview.h \
    DockOverlay.h \
    DockSplitter.h \
    DockAreaTitleBar.h \
    ElidingLabel.h \
    IconProvider.h \
    DockComponentsFactory.h 


SOURCES += \
    ads_globals.cpp \
    DockAreaWidget.cpp \
    DockAreaTabBar.cpp \
    DockContainerWidget.cpp \
    DockManager.cpp \
    DockWidget.cpp \
    DockingStateReader.cpp \
    DockWidgetTab.cpp \
    FloatingDockContainer.cpp \
    FloatingDragPreview.cpp \
    DockOverlay.cpp \
    DockSplitter.cpp \
    DockAreaTitleBar.cpp \
    ElidingLabel.cpp \
    IconProvider.cpp \
    DockComponentsFactory.cpp


unix {
HEADERS += linux/FloatingWidgetTitleBar.h
SOURCES += linux/FloatingWidgetTitleBar.cpp
}

isEmpty(PREFIX){
	PREFIX=..\installed
	warning("Install Prefix not set")
}
headers.path=$$PREFIX/include
headers.files=$$HEADERS
target.path=$$PREFIX/lib
INSTALLS += headers target

DISTFILES +=
