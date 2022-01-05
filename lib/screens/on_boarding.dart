import 'package:flutter/material.dart';
import 'package:swastha/models/on_boarding_slider.dart';
import 'package:swastha/screens/login.dart';
import 'package:swastha/screens/register.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/slide_tile.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id ='OnBoardingScreen';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: slides.length,
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return SlideTile(
                imageAssetPath: slides[index].imageAssetPath,
                title: slides[index].title,
                description: slides[index].description);
          }),
      bottomSheet: SizedBox(
        height: 120,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < slides.length; i++)
                  currentIndex == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                    currentIndex != slides.length - 1 ? 'Next' : 'Get Started'),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: primaryColor,
                  onSurface: Colors.grey,
                  elevation: 20,
                  minimumSize: const Size(240, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  if(currentIndex!= slides.length-1)
                    {
                      pageController.animateToPage(currentIndex + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                    }
                  else{
                      Navigator.pushNamed(context, Register.id);
                  }

                },
              ),
            ),
            GestureDetector(
              child: Text(
                currentIndex == 0 ? 'Skip' : 'Back',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                if (currentIndex == 0) {
                  pageController.animateToPage(slides.length - 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear);
                } else {
                  pageController.animateToPage(currentIndex - 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear);
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an Account ?',style: TextStyle(color: secondaryColor),
                ),
                GestureDetector(child: const Text('Sign in',style: TextStyle(
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                )),
                  onTap:(){
                    Navigator.pushNamed(context, Login.id);
                  },)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      height: isCurrentPage ? 12.0 : 8.0,
      width: isCurrentPage ? 12.0 : 8.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
