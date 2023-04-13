import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  List imgList = [
    {'id': 1, 'path': 'lib/assets/banner/AD_1.png'},
    {'id': 2, 'path': 'lib/assets/banner/AD_2.png'},
    {'id': 3, 'path': 'lib/assets/banner/AD_3.png'},
    {'id': 4, 'path': 'lib/assets/banner/AD_4.png'},
    {'id': 5, 'path': 'lib/assets/banner/AD_5.png'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: imgList
                .map(
                  (e) => Image.asset(
                    e['path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              height: 320,
              viewportFraction: 1,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              onPageChanged: (index, reason) {
                // print(currentIndex);
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          alignment: Alignment.bottomCenter,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: imgList.length,
            effect: ExpandingDotsEffect(
              dotWidth: 6,
              dotHeight: 6,
              dotColor: Colors.white.withOpacity(0.6),
              activeDotColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
