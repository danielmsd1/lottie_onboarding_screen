<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

* A lottie onboarding screen that you can use for your flutter applications.

## Features

```dart
LottieOnBoardingScreenData({
    Key? key,
    required this.title,
    required this.lottiePath,
    required this.description,
    required this.isItFromNetwork,
    this.titleSize = 20,
    this.titleFontFamily = 'roboto',
    this.descriptionSize = 14,
    this.descriptionFontFamily = 'roboto',
  }) : super(key: key);

```


## Usage

```dart
class OnBoardingScreen extends StatelessWidget {
  final List<LottieOnBoardingScreenData> list = [
    LottieOnBoardingScreenData(
      title: 'Hello, page 1',
      isItFromNetwork: true,
      titleSize: 14,
      description: 'This is an awesome description',
      descriptionSize: 12,
      lottiePath: 'https://assets5.lottiefiles.com/packages/lf20_h1bogema.json',
    ),
    LottieOnBoardingScreenData(
      title: 'Hello, page 2',
      isItFromNetwork: true,
      titleSize: 14,
      description: 'This is an awesome description',
      descriptionSize: 12,
      lottiePath: 'https://assets5.lottiefiles.com/packages/lf20_tulr8tag.json',
    ),
    LottieOnBoardingScreenData(
      title: 'Hello, page 3',
      isItFromNetwork: true,
      description: 'This is an awesome description',
      lottiePath: 'https://assets5.lottiefiles.com/packages/lf20_h1bogema.json',
    ),
  ];

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieOnBoardingScreenView(
      boardingScreens: list,
      pageRoute: MaterialPageRoute(
        builder: (context) => const AuthenticationScreen(),
      ),
    );
  }
}
```

## Additional information

This package depends on the (lottie package)[https://pub.dev/packages/lottie]
