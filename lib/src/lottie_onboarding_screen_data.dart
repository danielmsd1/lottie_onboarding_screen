import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieOnBoardingScreenData extends StatefulWidget {
  final String? lottiePath;
  final String? title;
  double? titleSize;
  String? titleFontFamily;
  final String? description;
  double? descriptionSize;
  String? descriptionFontFamily;
  final bool? isItFromNetwork;
  //
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

  @override
  State<LottieOnBoardingScreenData> createState() =>
      _LottieOnBoardingScreenDataState();
}

class _LottieOnBoardingScreenDataState
    extends State<LottieOnBoardingScreenData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.isItFromNetwork! == false
              ? Lottie.asset(
                  widget.lottiePath!,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.40,
                )
              : Lottie.network(
                  widget.lottiePath!,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.40,
                ),
          const SizedBox(
            height: 12.0,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.title!,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: widget.titleFontFamily!,
                  fontSize: widget.titleSize!,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.description!,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: widget.descriptionSize!,
                fontFamily: widget.descriptionFontFamily!,
              ),
            ),
          )
        ],
      ),
    );
  }
}
