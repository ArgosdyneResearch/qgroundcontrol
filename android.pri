include($$PWD/libs/qtandroidserialport/src/qtandroidserialport.pri)
message("Adding Serial Java Classes")
QT += androidextras

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

exists($$PWD/custom/android) {
    message("Merging $$PWD/custom/android/ -> $$PWD/android/")

    ANDROID_PACKAGE_SOURCE_DIR = $$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR
    android_source_dir_target.target = android_source_dir
    PRE_TARGETDEPS += $$android_source_dir_target.target
    QMAKE_EXTRA_TARGETS += android_source_dir_target
    #THANH: Fix android build

    win32{
    equals(QMAKE_HOST.os, Windows): DIR_EXISTS_CMD = if not exist %1 echo Initializing package source...
    else:                           DIR_EXISTS_CMD = test -d %1 && exit 0; echo "Initializing package source..."
    manifest_path = $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml
    manifest_tmp_path = $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml.sed

    android_source_dir_target.commands = \
        $$sprintf($$DIR_EXISTS_CMD, $$system_path($$ANDROID_PACKAGE_SOURCE_DIR)) && \
        $$QMAKE_MKDIR $$system_path($$ANDROID_PACKAGE_SOURCE_DIR) && \
        $$QMAKE_COPY_DIR $$system_path($$PWD/android/*) $$system_path($$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR) && \
        $$QMAKE_COPY_DIR $$system_path($$PWD/custom/android/*) $$system_path($$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR) && \
        $$QMAKE_STREAM_EDITOR -e \"s/package=\\\"org.mavlink.qgroundcontrol\\\"/package=\\\"$$QGC_ANDROID_PACKAGE\\\"/g\" \
            $$system_path($$manifest_path) > $$system_path($$manifest_tmp_path) && \
        $$QMAKE_MOVE $$system_path($$manifest_tmp_path) $$system_path($$manifest_path)
    } else {
       android_source_dir_target.commands = $$QMAKE_MKDIR $$ANDROID_PACKAGE_SOURCE_DIR && \
               $$QMAKE_COPY_DIR $$PWD/android/* $$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR && \
               $$QMAKE_COPY_DIR $$PWD/custom/android/* $$OUT_PWD/ANDROID_PACKAGE_SOURCE_DIR
               #&& \
               #$$QMAKE_STREAM_EDITOR -i \"s/package=\\\"org.mavlink.qgroundcontrol\\\"/package=\\\"$$QGC_ANDROID_PACKAGE\\\"/\" $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml
    }

    # --- End fix ----
    android_source_dir_target.depends = FORCE
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
