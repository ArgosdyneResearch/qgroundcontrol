include($$PWD/libs/qtandroidserialport/src/qtandroidserialport.pri)
message("Adding Serial Java Classes")
QT += androidextras

ANDROID_PACKAGE_SOURCE_DIR          = $$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR  # Tells Qt location of package files for build
ANDROID_PACKAGE_QGC_SOURCE_DIR      = $$PWD/android                         # Original location of QGC package files
ANDROID_PACKAGE_CUSTOM_SOURCE_DIR   = $$PWD/custom/android                  # Original location for custom build override package files
ANDROID_PACKAGE_SETTING_FILE         = $$OUT_PWD/android-AlesQGroundControl-deployment-settings.json
ANDROID_PACKAGE_SETTING_FILE_TMP     = $$OUT_PWD/android-AlesQGroundControl-deployment-settings-tmp.json

# We always move the package files to the ANDROID_PACKAGE_SOURCE_DIR build dir so we can modify the manifest as needed



contains(QMAKE_HOST.os, Windows){
    message("Win32: Prepairing android build folder")
    android_source_dir_target.target = $$system_path($$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml)
    DIR_EXISTS_CMD = if not exist %1 echo Initializing package source...
    manifest_path = $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml
    manifest_tmp_path = $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml.sed

    android_source_dir_target.commands = \
        $$sprintf($$DIR_EXISTS_CMD, $$system_path($$ANDROID_PACKAGE_SOURCE_DIR)) && \
        $$QMAKE_MKDIR $$system_path($$ANDROID_PACKAGE_SOURCE_DIR) && \
        $$QMAKE_COPY_DIR $$system_path($$ANDROID_PACKAGE_QGC_SOURCE_DIR/*) $$system_path($$ANDROID_PACKAGE_SOURCE_DIR)

    PRE_TARGETDEPS += $$android_source_dir_target.target
    QMAKE_EXTRA_TARGETS += android_source_dir_target
} else {
    message("Unix: Prepairing android build folder")
    manifest_path = $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml
    manifest_tmp_path = $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml.sed
    android_source_dir_target.target = $$system_path($$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml)
    android_source_dir_target.commands = \
        $$QMAKE_MKDIR $$system_path($$ANDROID_PACKAGE_SOURCE_DIR) && \
        $$QMAKE_COPY_DIR $$system_path($$ANDROID_PACKAGE_QGC_SOURCE_DIR/*) $$system_path($$ANDROID_PACKAGE_SOURCE_DIR)
    PRE_TARGETDEPS += $$android_source_dir_target.target
    QMAKE_EXTRA_TARGETS += android_source_dir_target
}


exists($$ANDROID_PACKAGE_CUSTOM_SOURCE_DIR/AndroidManifest.xml) {
    android_source_dir_target.depends = $$system_path($$ANDROID_PACKAGE_CUSTOM_SOURCE_DIR/AndroidManifest.xml)
} else {
    android_source_dir_target.depends = $$system_path($$ANDROID_PACKAGE_QGC_SOURCE_DIR/AndroidManifest.xml)
}

# Custom builds can override android package file
exists($$ANDROID_PACKAGE_CUSTOM_SOURCE_DIR) {
    contains(QMAKE_HOST.os, Windows){
        message("Win32: Merging$$ $$ANDROID_PACKAGE_QGC_SOURCE_DIR and $$ANDROID_PACKAGE_CUSTOM_SOURCE_DIR to $$ANDROID_PACKAGE_SOURCE_DIR")
        android_source_dir_target.commands = $$android_source_dir_target.commands && \
            $$QMAKE_COPY_DIR $$system_path($$PWD/custom/android/*) $$system_path($$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR) && \
            $$QMAKE_STREAM_EDITOR -e \"s/package=\\\"org.mavlink.qgroundcontrol\\\"/package=\\\"$$QGC_ANDROID_PACKAGE\\\"/g\" \
                $$system_path($$manifest_path) > $$system_path($$manifest_tmp_path) && \
            $$QMAKE_MOVE $$system_path($$manifest_tmp_path) $$system_path($$manifest_path) &&\
            $$QMAKE_STREAM_EDITOR -e \"s/android-min-sdk-version\\\": \\\".*\\\"/android-min-sdk-version\\\": \\\"28\\\"/g\" \
                $$system_path($$ANDROID_PACKAGE_SETTING_FILE) > $$system_path($$ANDROID_PACKAGE_SETTING_FILE_TMP) && \
            $$QMAKE_MOVE $$system_path($$ANDROID_PACKAGE_SETTING_FILE_TMP) $$system_path($$ANDROID_PACKAGE_SETTING_FILE)
    } else {
        message("Unix: Merging$$ $$ANDROID_PACKAGE_QGC_SOURCE_DIR and $$ANDROID_PACKAGE_CUSTOM_SOURCE_DIR to $$ANDROID_PACKAGE_SOURCE_DIR")
        android_source_dir_target.commands = $$android_source_dir_target.commands && \
            $$QMAKE_COPY_DIR $$system_path($$PWD/custom/android/*) $$system_path($$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR) && \
            $$QMAKE_STREAM_EDITOR -e \"s/package=\\\"org.mavlink.qgroundcontrol\\\"/package=\\\"$$QGC_ANDROID_PACKAGE\\\"/g\" \
                $$system_path($$manifest_path) > $$system_path($$manifest_tmp_path) && \
            $$QMAKE_MOVE $$system_path($$manifest_tmp_path) $$system_path($$manifest_path) &&\
            $$QMAKE_STREAM_EDITOR -e \"s/android-min-sdk-version\\\": \\\".*\\\"/android-min-sdk-version\\\": \\\"28\\\"/g\" \
                $$system_path($$ANDROID_PACKAGE_SETTING_FILE) > $$system_path($$ANDROID_PACKAGE_SETTING_FILE_TMP) && \
            $$QMAKE_MOVE $$system_path($$ANDROID_PACKAGE_SETTING_FILE_TMP) $$system_path($$ANDROID_PACKAGE_SETTING_FILE)
        # android_source_dir_target.commands = $$android_source_dir_target.commands && \
        #           $$QMAKE_COPY_DIR $$ANDROID_PACKAGE_CUSTOM_SOURCE_DIR/* $$ANDROID_PACKAGE_SOURCE_DIR && \
        #           $$QMAKE_STREAM_EDITOR -i \"s/package=\\\"org.mavlink.qgroundcontrol\\\"/package=\\\"$$QGC_ANDROID_PACKAGE\\\"/\" $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml && \
        #           $$QMAKE_STREAM_EDITOR -i \"s/android-min-sdk-version\\\": \\\".*\\\"/android-min-sdk-version\\\": \\\"28\\\"/\" $$ANDROID_PACKAGE_SETTING_FILE
    }
}

exists($$PWD/custom/android/AndroidManifest.xml) {
    OTHER_FILES += \
    $$PWD/custom/android/AndroidManifest.xml
} else {
    OTHER_FILES += \
    $$PWD/android/AndroidManifest.xml
}

OTHER_FILES += \
    $$PWD/android/res/xml/device_filter.xml \
    $$PWD/android/src/com/hoho/android/usbserial/driver/CdcAcmSerialDriver.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/CommonUsbSerialDriver.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/Cp2102SerialDriver.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/FtdiSerialDriver.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/ProlificSerialDriver.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/UsbId.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/UsbSerialDriver.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/UsbSerialProber.java \
    $$PWD/android/src/com/hoho/android/usbserial/driver/UsbSerialRuntimeException.java \
    $$PWD/android/src/org/mavlink/qgroundcontrol/QGCActivity.java \
    $$PWD/android/src/org/mavlink/qgroundcontrol/UsbIoManager.java \
    $$PWD/android/src/org/mavlink/qgroundcontrol/TaiSync.java \
    $$PWD/android/src/org/freedesktop/gstreamer/androidmedia/GstAhcCallback.java \
    $$PWD/android/src/org/freedesktop/gstreamer/androidmedia/GstAhsCallback.java \
    $$PWD/android/src/org/freedesktop/gstreamer/androidmedia/GstAmcOnFrameAvailableListener.java


DISTFILES += \
    $$PWD/android/gradle/wrapper/gradle-wrapper.jar \
    $$PWD/android/gradlew \
    $$PWD/android/res/values/libs.xml \
    $$PWD/android/build.gradle \
    $$PWD/android/gradle/wrapper/gradle-wrapper.properties \
    $$PWD/android/gradlew.bat

INCLUDEPATH += \
    $$PWD/android/src
