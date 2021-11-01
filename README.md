# Book List

## Installation
  - Dart 2.14.4
  - Flutter 2.5.3
- [Install Flutter](https://flutter.dev/get-started/)
- [Flutter documentation](https://flutter.dev/docs)

## Environment
**iOS**
- iOS 13+

**Android**
- Android 5.1+
    - minSdkVersion 22
- targetSdkVersion 30

## App architecture
- Base on [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) + [Repository](https://docs.microsoft.com/ja-jp/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-design)

## Code Style
- [flutter_lints](https://pub.dev/packages/flutter_lints)

## Assets, Fonts

**If added some assets or fonts**

- Use [FlutterGen](https://github.com/FlutterGen/flutter_gen/)

## Models

**If added some models for api results**

- Use [Freezed](https://pub.dev/packages/freezed)

## Localizations

**If added some localizations (i.g. edited [*.arb](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/lib/l10n))**

- Use [Official Flutter localization package](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc)

## Code collections

#### Project settings
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Dart | Dart version | [pubspec.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/pubspec.yaml#L7-L9) |
| ✅ | Dart | Switching between Development and Production environment | [constants.dart](https://github.com/ahiroshima/blob/main/lib/foundation/constants.dart), [runConfigurations](https://github.com/ahiroshima/book-list/tree/main/.idea/runConfigurations), [Makefile](https://github.com/ahiroshima/book-list/blob/main/Makefile#L25-L41) |
| ✅ | Dart | Lint / Analyze | [analysis_options.yaml](https://github.com/ahiroshima/book-lilst/blob/main/analysis_options.yaml) |
| ✅ | Android | Kotlin version | [build.gradle](https://github.com/ahiroshima/book-list/blob/main/android/build.gradle#L2) |
| ✅ | Android | Apk attributes | build.gradle ([compileSdkVersion](https://github.com/ahiroshima/book-list/blob/main/android/app/build.gradle#L30), [applicationId](https://github.com/ahiroshima/book-list/blob/main/android/app/build.gradle#L43), [minSdkVersion](https://github.com/ahiroshima/book-list/blob/main/android/app/build.gradle#L44), [targetSdkVersion](https://github.com/ahiroshima/book-list/blob/main/android/app/build.gradle#L45)) |
| ✅ | Android | Switching between Development and Production environment | [build.gradle](https://github.com/ahiroshima/book-list/blob/main/android/app/build.gradle#L50-L75), [Flavor dirs](https://github.com/ahiroshima/book-list/tree/main/android/app/src), [signingConfigs](https://github.com/ahiroshima/book-list/tree/main/android/app/signingConfigs) |
| ✅ | iOS | Xcode version | [compatibilityVersion](https://github.com/ahiroshima/book-list/blob/main/ios/Runner.xcodeproj/project.pbxproj#L182) |
| ✅ | iOS | Podfile | [Podfile](https://github.com/ahiroshima/book-list/blob/main/ios/Podfile) |
| ✅ | iOS | Switching between Development and Production environment | [xcconfig](https://github.com/ahiroshima/book-list/tree/main/ios/Config), [Podfile](https://github.com/ahiroshima/book-list/blob/main/ios/Podfile#L7-L12) |
| ✅ | [Firebase](https://firebase.flutter.dev/docs/overview) | [Android] Switching between Development and Production google-service.json using flavors | [development and production](https://github.com/ahiroshima/book-list/tree/main/android/app/src) |
| ✅ | [Firebase](https://firebase.flutter.dev/docs/overview) | [iOS] Switching between Development and Production GoogleService-Info.plist using run script| [copy_google_service.sh](https://github.com/ahiroshima/book-list/blob/main/ios/Scripts/copy_google_service.sh), [development and production](https://github.com/ahiroshima/book-list/tree/main/ios/Runner/Resources/Firebase) |
| ✅ | [Firebase Auth](https://firebase.flutter.dev/docs/auth/overview) | SignIn, SignOut | [auth_data_source_impl.dart](https://github.com/ahiroshima/book-list/blob/main/lib/data/remote/auth_data_source_impl.dart) |
| ✅ | [Firebase Crashlytics](https://firebase.flutter.dev/docs/crashlytics/overview) | Crash Reports | [main.dart](https://github.com/ahiroshima/book-list/blob/main/lib/main.dart) |
| ✅ | [Firebase Performance](https://firebase.flutter.dev/docs/performance/overview) | Network monitoring with [dio_firebase_performance](https://pub.dev/packages/dio_firebase_performance) | [app_dio.dart](https://github.com/ahiroshima/book-list/blob/main/lib/data/remote/app_dio.dart#L27-L28) |

#### Architecture

|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Base | Using [Riverpod](https://pub.dev/packages/riverpod) + [Hooks](https://pub.dev/packages/flutter_hooks) + [ChangeNotifier](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#changenotifier) + MVVM |
| ✅ | Networking | Using [dio](https://pub.dev/packages/dio) and [Retofit](https://pub.dev/packages/retrofit) | [app_dio.dart](https://github.com/ahiroshima/book-list/blob/main/lib/data/remote/app_dio.dart) |
| ✅ | Data | Using [Freezed](https://pub.dev/packages/freezed) | [model classes](https://github.com/ahiroshima/book-list/blob/main/lib/data/model) |
| ✅ | Constants | Define constants and route names | [constants.dart](https://github.com/ahiroshima/book-list/blob/main/lib/foundation/constants.dart) |
| ✅ | Localization | Switching between two languages with [Intl package](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/edit) | [*.arb](https://github.com/ahiroshima/book-list/tree/main/lib/l10n) |
| ✅ | Error handling | Using Result pattern - A value that represents either a success or a failure, including an associated value in each case. | [result.dart](https://github.com/ahiroshima/book-list/blob/main/lib/data/model/result.dart), [home_page.dart](https://github.com/ahiroshima/book-list/blob/main/lib/ui/home/home_page.dart#L51-L63) |

#### UI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Theme | Staticly Switch between light and dark themes | [app_theme.dart](https://github.com/ahiroshima/book-list/blob/main/lib/app.dart#L15-L17) |
| ✅ | Font | Using [Google font](https://pub.dev/packages/google_fonts) | [app_theme.dart](https://github.com/ahiroshima/book-list/blob/main/lib/ui/theme/app_theme.dart#L40) |
| ✅ | Transition | Simple animation between screens using [Hero](https://flutter.dev/docs/development/ui/animations/hero-animations) | [article_item.dart](https://github.com/ahiroshima/book-list/blob/main/lib/ui/component/article_item.dart#L28), [detail_page.dart](https://github.com/ahiroshima/book-list/blob/main/lib/ui/detail/datail_page.dart#L13-L24) |

#### Testing
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | API(Repositories) | Using [mocktail](https://github.com/felangel/mocktail) | [view_mode_test.dart](https://github.com/ahiroshima/book-list/blob/main/test/ui/view_model_test.dart) |
| ✅️ | UI | Using [mocktail](https://github.com/felangel/mocktail) | [widget_test.dart](https://github.com/ahiroshima/book-list/blob/main/test/ui/widget_test.dart) |
| ✅ | Coverage reports | Send the report to [Codecov](https://codecov.io/) on CI |[codecov.yml](https://github.com/ahiroshima/book-list/blob/main/codecov.yml), [codecov.sh](https://github.com/ahiroshima/book-list/blob/main/scripts/codecov.sh), [flutte-ci.yml](https://github.com/ahiroshima/book-list/blob/main/.github/workflows/flutter-ci.yml#L66-L71) |

#### CI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Git | Git hooks for format and analyze | [package.json](https://github.com/ahiroshima/book-list/blob/main/package.json#L4-L11), [Makefile](https://github.com/ahiroshima/book-list/blob/main/Makefile#L9-L12)|
| ✅ | Git | .gitignore settings | [.gitignore](https://github.com/ahiroshima/book-list/blob/main/.gitignore) |
| ✅ | Build | Using [Codemagic](https://codemagic.io/) |[codemagic.yaml](https://github.com/ahiroshima/book-list/blob/main/codemagic.yaml)|
| ✅ | Build | Using [Bitrise](https://www.bitrise.io/) |[bitrise.yml](https://github.com/ahiroshima/book-list/blob/main/bitrise.yml)|
| ✅ | Build | Using [Github Actions](https://github.com/features/actions) | [.github/workflows/flutter-ci.yml](https://github.com/ahiroshima/book-list/blob/main/.github/workflows/flutter-ci.yml) |

## Getting Started


### Setup

```shell script
$ make setup
$ export PATH="$PATH":"$HOME/.pub-cache/bin" # Add your run-commands (.zshrc, .bashrc, etc)
$ make dependencies
$ make build-runner
```

### How to add assets(images..)
1. Add assets
2. Run [FlutterGen](https://github.com/fluttergen)

### How to add localizations
1. Edit [*.arb](https://github.com/ahiroshima/book-list/tree/main/lib/l10n) files.
2. Run generate the `flutter pub get`

<br/>

### Make .apk and .ipa file

<img height="540px" src="https://github.com/ahiroshima/art/raw/master/book-list/running-app.gif" align="left" />

Android
```shell script
$ make build-android-dev
$ make build-android-prd
```

iOS
```shell script
$ make build-ios-dev
$ make build-ios-prd
```

### Run app
```shell script
$ make run-dev
$ make run-prd
```