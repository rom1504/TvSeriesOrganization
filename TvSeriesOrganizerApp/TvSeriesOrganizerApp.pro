CONFIG += c++11

# Add more folders to ship with the application, here
DEPLOYMENTFOLDERS =

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

TARGET = TvSeriesOrganizer

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    model/season.cpp \
    model/episode.cpp \
    controller/controller.cpp \
    model/series.cpp \
    model/serieslist.cpp \
    model/qqmlnetworkaccessmanagerfactorywithcache.cpp \
    model/serieslistlist.cpp \
    model/plugin.cpp \
    TvSeriesOrganizerPluginInterface/episodeplugininterface.cpp \
    model/actor.cpp \
    model/actorlist.cpp \
    model/image.cpp \
    model/settings.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    model/season.h \
    model/episode.h \
    controller/controller.h \
    model/series.h \
    model/serieslist.h \
    model/qqmlnetworkaccessmanagerfactorywithcache.h \
    model/serieslistlist.h \
    TvSeriesOrganizerPluginInterface/abstractplugin.h \
    model/plugin.h \
    TvSeriesOrganizerPluginInterface/episodeplugininterface.h \
    model/actor.h \
    model/actorlist.h \
    model/image.h \
    model/settings.h


QMAKE_CXXFLAGS += -std=c++11

RESOURCES += \
    resources.qrc \
    ../GeneralQmlItems/GeneralQmlItemsResources.qrc


OTHER_FILES += android/AndroidManifest.xml

QT+= xml


INCLUDEPATH += $$PWD/../GeneralQmlItems
DEPENDPATH += $$PWD/../GeneralQmlItems

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android


TRANSLATIONS += translations/TvSeriesOrganizer_fr_FR.ts
TRANSLATIONS += translations/TvSeriesOrganizer_en.ts
TRANSLATIONS += translations/TvSeriesOrganizer_it.ts
TRANSLATIONS += translations/TvSeriesOrganizer_de.ts
TRANSLATIONS += translations/TvSeriesOrganizer_es.ts
TRANSLATIONS += translations/TvSeriesOrganizer_zh.ts
TRANSLATIONS += translations/TvSeriesOrganizer_ro_RO.ts

lupdate_only{
SOURCES = view/Episode.qml \
    view/EpisodeDetails.qml \
    view/SeasonDetails.qml \
    view/Season.qml \
    view/SeriesDetails.qml \
    view/Series.qml \
    view/SeenIndicator.qml \
    view/MainView.qml \
    view/ListPage.qml \
    view/SimplePage.qml \
    view/TabItem.qml \
    view/TabPage.qml \
    view/SeriesSearch.qml \
    view/ExploreSeries.qml \
    view/ImageViewer.qml \
    view/SeriesListPage.qml \
    view/SeriesList.qml  \
    view/SeriesGrid.qml \
    view/ThumbnailSeries.qml \
    view/Settings.qml \
    view/SeriesCollection.qml
}

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../SignalList/release/ -lSignalList
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../SignalList/debug/ -lSignalList
else:unix: LIBS += -L$$OUT_PWD/../SignalList/ -lSignalList

INCLUDEPATH += $$PWD/../SignalList/source
DEPENDPATH += $$PWD/../SignalList/source

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../SignalList/release/libSignalList.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../SignalList/debug/libSignalList.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../SignalList/release/SignalList.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../SignalList/debug/SignalList.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../SignalList/libSignalList.a
