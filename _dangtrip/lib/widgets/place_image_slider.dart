import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlaceImageSlider extends StatefulWidget {
  final List<dynamic> imageList;

  const PlaceImageSlider({
    required this.imageList,
    super.key,
  });

  @override
  State<PlaceImageSlider> createState() => _PlaceImageSliderState();
}

final CarouselController carouselController = CarouselController();

class _PlaceImageSliderState extends State<PlaceImageSlider> {
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
            items: widget.imageList
                .map(
                  (e) => Image.network(
                    e['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              height: 360,
              viewportFraction: 1,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              onPageChanged: (index, reason) {
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
            count: widget.imageList.length,
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
