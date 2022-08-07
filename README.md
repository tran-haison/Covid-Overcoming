# covid_overcoming

A mobile application built to support people in post-COVID-19 health recovery


### Environment

- Flutter 2.10.5 • channel stable • https://github.com/flutter/flutter.git
- Tools • Dart 2.16.2 • DevTools 2.9.2
- Android Studio • latest version • https://developer.android.com/studio


### Android/iOS version

- Android
  - compileSdkVersion: 31
  - minSdkVersion 21
  - targetSdkVersion 31
 
- iOS: 
  - deployment info: iOS 12.0
  

### Build setup

``` bash
# Sync package dependency
$ flutter pub get
# Generate files for packages
$ flutter pub run build_runner build --delete-conflicting-outputs
```


### Build
``` bash
# To run development
$ flutter run lib/main.dart
# ----------
# Android Build Apk 
$ flutter build apk --release
# Android Build App Bundle
$ flutter build appbundle --release
# ----------
# iOS Build ipa
$ flutter build ipa --release
# iOS Build ios
$ flutter build ios --release --no-codesign
```

  

