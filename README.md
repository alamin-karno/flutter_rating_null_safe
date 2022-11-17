
# Flutter Ratings Native

A Flutter package to show ratings in a beautiful way. It is highly customizable and easy to use. It is inspired by [Flutter Rating](https://pub.dev/packages/flutter_rating) package as this is now not null-saftey enable & maintainer not updatig the package.

<p align="center">
  <a href="https://pub.dev/packages/flutter_rating_native"><img alt="pub version" src="https://img.shields.io/pub/v/flutter_rating_native?color=%2300b0ff&label=flutter_rating_native&style=flat-square"></a>
  <a href="https://codecov.io/gh/alamin-karno/flutter_rating_native">
  <img src="https://codecov.io/gh/alamin-karno/flutter_rating_native/branch/master/graph/badge.svg?token=NULL"/>
  </a>
  <img alt="last commit" src="https://img.shields.io/github/last-commit/alamin-karno/flutter_rating_native?color=%23ffa000&style=flat-square"/>
  <img alt="license" src="https://img.shields.io/github/license/alamin-karno/flutter_rating_native?style=flat-square"/>
  <img alt="stars" src="https://img.shields.io/github/stars/alamin-karno/flutter_rating_native?style=social"/>
</p>

Note: This plugin is still under development, anyone want to contribute on this project is most welcome. If you have any idea or suggestion, please feel free to contact me.

## Features

- [x] Null-safety enable
- [x] Easy to use
- [x] Highly customizable
- [x] Supports both Android and iOS
- [x] Supports both horizontal and vertical directions
- [x] Supports both full and half ratings

## Getting started

You just need to add the dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_rating_native: ^0.0.1
```

## Usage

Add the following import to your Dart code:

```dart
import 'package:flutter_rating_native/flutter_rating_native.dart';
```

then just use code like this:

```dart
FlutterRatings(
  rating: 3.5,
  starCount: 5,
  borderColor: Colors.grey,
  color: Colors.amber,
  allowHalfRating: true,
  size: 20,
  mainAxisAlignment: MainAxisAlignment.center,
  onRatingChanged: (rating) {
    print(rating);
  },
),
```

## Screenshot (GIF)

| Flutter Rating UI (GIF) |
| :---: |
| <img src="https://github.com/alamin-karno/flutter_rating_native/blob/main/example/screenshots/flutter_rattings.gif?raw=true"> |

## Additional information

- [Flutter Ratings (pub.dev)](https://pub.dev/packages/flutter_rating_native)
- [Flutter Ratings (GitHub)](https://github.com/alamin-karno/flutter_rating_native)

<h3 align=center> Project Maintainer ❤️ </h3>
<p align="center">
<table align="center">
  <tbody><tr>
     <td align="center">
     <a href="https://github.com/alamin-karno">
     <img alt="Md. Al-Amin" src="https://avatars.githubusercontent.com/alamin-karno" width="125px;"> <br>
     <sub><b> Md. Al-Amin </b></sub>
     </a><br></td></tr>
     </tbody> </table> </p>


<h3 align="center"> ✨VALUABLE CONTRIBUTORS✨ </h3>
<p align="center">
<a href="https://github.com/alamin-karno/flutter_rating_native/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=alamin-karno/flutter_rating_native" />
</a>
</p>
<h3 align="center"> Happy Coding 👨‍💻 </h3>

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
