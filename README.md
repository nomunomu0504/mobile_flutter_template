<h1 align="center">
  Mobile Flutter Template
</h1>

<div align="center">
This is full-stack flutter template for mobile(android,ios).

This project can handle two environments, `development` and `production`.

⚡⚡ Important ⚡⚡

This project assumes the use of a Firebase project.

Be sure to run the Firebase auto-configuration script built into the repository.

If you do not run the script, the project build will fail.
</div>


<p align="center">
  <a href="https://github.com/nomunomu0504/mobile_flutter_template/issue">
    <img alt="issue" src="https://img.shields.io/github/issues/nomunomu0504/mobile_flutter_template?style=for-the-badge" />
  </a>
  <img alt="GitHub forks" src="https://img.shields.io/github/forks/nomunomu0504/mobile_flutter_template?style=for-the-badge" />
  <a href="./LICENSE">
    <img alt="license" src="https://img.shields.io/github/license/nomunomu0504/mobile_flutter_template?style=for-the-badge" />
  </a>

  <img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/nomunomu0504?style=for-the-badge">
  <img alt="Twitter URL" src="https://img.shields.io/twitter/url?color=1DA1F2&style=for-the-badge&url=https%3A%2F%2Fgithub.com%2Fnomunomu0504%2Fmobile_flutter_template">
</p>

---

## Table of Content
- [Pre Installed Libraries](#pre-installed-libraries)
  - [Utils](#utils)
  - [Svg](#svg)
  - [AppIcon](#appicon)
  - [Model](#model)
  - [HttpClient](#httpclient)
  - [Storage](#storage)
  - [RiverPod](#riverpod)
  - [Firebase](#firebase)
  - [Permission](#permission)
  - [Provider](#provider)
  - [Router](#router)
  - [Others](#others)
- [Usage](#usage)
  - [Firebase Configuration](#firebase-configuration)
  - [AppIcon Configuration](#appicon-configuration)
  - [Application Build](#application-build)
  - [Application Release Build](#application-release-build)


## Project Information

This project is implemented using the MVVM+Repository pattern architecture.

It includes settings for VSCode and Android Studio by default.

|         |              |
| :------ | :----------- |
| Flutter | 3.3.4-stable |
| Dart    | 2.18.2       |

We use `asdf` for version control, but there is no specification.

You can also use `fvm`, so please set it up by yourself.

# Pre Installed Libraries

Listed below are the libraries that will be pre-installed in this project.

## Utils

| **Package Name** | **Version** |
| :--------------- | :---------- |
| enum_to_string   | ^2.0.1      |
| intl             | ^0.17.0     |
| timezone         | ^0.9.1      |
| simple_logger    | ^1.9.0      |
| collection       | ^1.16.0     |
| built_collection | ^5.1.1      |

## Svg

| **Package Name** | **Version** |
| :--------------- | :---------- |
| flutter_svg      | ^1.1.4      |

## AppIcon

| **Package Name**       | **Version** |
| :--------------------- | :---------- |
| flutter_launcher_icons | ^0.11.0     |

## Model

| **Package Name**   | **Version** |
| :----------------- | :---------- |
| freezed_annotation | ^2.1.0      |

## HttpClient

| **Package Name** | **Version** |
| :--------------- | :---------- |
| dio              | ^4.0.6      |

## Storage

| **Package Name**       | **Version** |
| :--------------------- | :---------- |
| shared_preferences     | ^2.0.15     |
| flutter_secure_storage | ^7.0.1      |

## RiverPod

| **Package Name** | **Version** |
| :--------------- | :---------- |
| flutter_hooks    | ^0.18.5+1   |
| hooks_riverpod   | ^2.1.3      |

## Firebase

| **Package Name**       | **Version** |
| :--------------------- | :---------- |
| firebase_core          | ^2.4.1      |
| cloud_firestore        | ^4.3.1      |
| firebase_crashlytics   | ^3.0.9      |
| firebase_analytics     | ^10.1.0     |
| firebase_remote_config | ^3.0.9      |
| firebase_messaging     | ^14.2.1     |
| firebase_auth          | ^4.2.5      |

## Permission

| **Package Name**   | **Version** |
| :----------------- | :---------- |
| permission_handler | ^10.0.0     |

## Provider

| **Package Name** | **Version** |
| :--------------- | :---------- |
| path_provider    | ^2.0.11     |

## Router

| **Package Name**     | **Version** |
| :------------------- | :---------- |
| route_observer_mixin | ^1.7.0      |

## Others

| **Package Name** | **Version** |
| :--------------- | :---------- |
| url_launcher     | ^6.1.6      |
| uni_links        | ^0.5.1      |

# Usage
## Firebase Configuration
This project is a template project for using Firebase projects.

To configure Firebase in this project, you need to modify the contents of `scripts/download_firebase_app_configuration.sh` and execute it.

Replace the app ID of the Firebase project you want to use with `<YOUR_APP_ID>` of the corresponding environment and uncomment it out.

If you have an operating system you do not want to use, comment it out.

```sh
#!/bin/bash -eu
# Execute on project root directory.

function fetchAndroid() {
  JSON_PATH=android/app/src/$1/google-services.json
  rm -f $JSON_PATH
  firebase apps:sdkconfig android $2 --out $JSON_PATH
}

function fetchIOS() {
  PLIST_PATH=ios/Runner/Firebase/GoogleService-Info-$1.plist
  rm -f $PLIST_PATH
  firebase apps:sdkconfig ios $2 --out $PLIST_PATH
}

echo "==== development ===="

# fetchIOS development <YOUR_APP_ID>
# fetchAndroid development <YOUR_APP_ID>

echo "==== production ===="

# fetchIOS production <YOUR_APP_ID>
# fetchAndroid production <YOUR_APP_ID>
```

```sh
$ sh scripts/download_firebase_app_configuration.sh
```

## AppIcon Configuration
In this project, you can use `flutter_launcher_icons` to switch app icons between `development` and `production`.

The app icon for `development` should be named `app_icon_dev.png` and the app icon for `production` should be named `app_icon.png` and saved in `assets/images`.

The configuration files for each are as follows
- flutter_launcher_icons-development.yaml
- flutter_launcher_icons-production.yaml

After setting the app icon, run the script.

```sh
flutter_template on  main [✘!+] is 📦 v1.0.0+1 via 🎯 v2.18.2 on ☁️  (ap-northeast-1)
❯ sh scripts/app_icon_build.sh
This command is deprecated and replaced with "flutter pub run flutter_launcher_icons"
  ════════════════════════════════════════════
     FLUTTER LAUNCHER ICONS (v0.11.0)
  ════════════════════════════════════════════


Flavor: development
• Creating default icons Android
• Overwriting the default Android launcher icon with a new icon
• Building iOS launcher icon for development
Creating Icons for Web...
⚠️Requirements failed for platform Web. Skipped
Creating Icons for Windows...
⚠️Windows config is not provided or windows.generate is false. Skipped...
⚠️Requirements failed for platform Windows. Skipped
Creating Icons for MacOS...
⚠️Requirements failed for platform MacOS. Skipped

Flavor: production
• Creating default icons Android
• Overwriting the default Android launcher icon with a new icon
• Building iOS launcher icon for production
Creating Icons for Web...
Creating Icons for Windows...
Creating Icons for MacOS...

✓ Successfully generated launcher icons for flavors
⚠️Requirements failed for platform Web. Skipped
⚠️Windows config is not provided or windows.generate is false. Skipped...
⚠️Requirements failed for platform Windows. Skipped
⚠️Requirements failed for platform MacOS. Skipped
```

## Application Build
It is possible to launch the application in three different patterns.
- Development Debug
- Production Debug
- Production Release

If you are using VSCode, you can choose from `Run and Debug` in the side menu, and if you are using Android Studio, you can choose from `Configurations`.

## Application Release Build

Run a build script to upload the app to PlayStore or Testflight.

※ This script does not actually upload the app to PlayStore or Testflight.  
※ It provides build commands to prepare for the upload.

A total of four scripts are built in, covering two OSs, one for `android` and one for `iOS`, and two patterns, one for `Debug` and one for `Release`.

- android_build_development.sh
- android_build_production.sh
- ios_build_development.sh
- ios_build_production.sh
