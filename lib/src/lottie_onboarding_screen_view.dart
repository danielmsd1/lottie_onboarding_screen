import 'package:flutter/material.dart';

import '../lottie_onboarding_screen.dart';

class LottieOnBoardingScreenView extends StatefulWidget {
  final List<LottieOnBoardingScreenData>? boardingScreens;
  final MaterialPageRoute? pageRoute;
  const LottieOnBoardingScreenView({
    Key? key,
    this.boardingScreens,
    this.pageRoute,
  }) : super(key: key);

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute!);
  }

  @override
  State<LottieOnBoardingScreenView> createState() =>
      _LottieOnBoardingScreenViewState();
}

class _LottieOnBoardingScreenViewState
    extends State<LottieOnBoardingScreenView> {
  //
  final PageController pageController = PageController();
  int currentPage = 0;
  bool lastPage = false;

  //
  void _onPageChanged(int page) {
    currentPage = page;
    if (currentPage == widget.boardingScreens!.length) {
      lastPage = true;
    }
    lastPage = false;
    setState(() {});
  }

  //
  Widget _buildPageIndicator(int page) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: widget.boardingScreens!,
              controller: pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          //
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () => lastPage ? null : widget.skipPage(context),
                  child: Text(
                    lastPage ? "" : "SKIP",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      _buildPageIndicator(0),
                      _buildPageIndicator(1),
                      _buildPageIndicator(2),
                    ],
                  ),
                ),
                //
                TextButton(
                  onPressed: () => lastPage
                      ? widget.skipPage(context)
                      : pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                  child: Text(
                    lastPage ? 'GOT IT' : 'NEXT',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
