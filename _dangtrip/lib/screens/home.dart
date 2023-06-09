import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/restaurant/view/restaurant_screen.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/screens/maps.dart';
import 'package:_dangtrip/screens/photo.dart';
import 'package:_dangtrip/screens/trip.dart';
import 'package:_dangtrip/widgets/banner_slide.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  // final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller.addListener(tabListner);
  }

  @override
  void dispose() {
    controller.removeListener(tabListner);
    super.dispose();
  }

  void tabListner() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: TEXT_DIMMED,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: '주변',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.route_outlined),
              label: '여행짜기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera_back),
              label: '댕생네컷',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining_outlined),
              label: '주문',
            ),
          ],
        ),
        child: TabBarView(
          //좌우 스크롤 고정
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            const Column(
              children: [
                HomeBanner(),
              ],
            ),
            const NaverMapTest(),
            Trip(),
            const Photo(),
            const RestaurantScreen(),
          ],
        ));
  }
}
