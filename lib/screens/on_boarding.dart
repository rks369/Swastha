import 'package:flutter/material.dart';
import 'package:swastha/models/on_boarding_slider.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/slide_tile.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> slides = [];
  int currentIndex = 0;

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
          onPageChanged: (value){
            setState(() {
              currentIndex=value;
            });
          },
          itemBuilder: (context, index) {
            return SlideTile(
                imageAssetPath: slides[index].imageAssetPath,
                title: slides[index].title,
                description: slides[index].description);
          }),
      bottomSheet: SizedBox(
        height: 100,
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
                child: const Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: primaryColor,
                  onSurface: Colors.grey,
                  elevation: 20,
                  minimumSize: const Size(240,50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed:() {

                },
              ),
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
      height: isCurrentPage ? 12.0: 8.0,
      width: isCurrentPage ? 12.0 : 8.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
