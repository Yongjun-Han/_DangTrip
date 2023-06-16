import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/restaurant/view/restaurant_screen.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/screens/hotplace_detail.dart';
import 'package:_dangtrip/screens/maps.dart';
import 'package:_dangtrip/screens/photo.dart';
import 'package:_dangtrip/screens/trip.dart';
import 'package:_dangtrip/widgets/banner_slide.dart';
import 'package:_dangtrip/widgets/hotplace.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            SingleChildScrollView(
              child: Column(
                children: [
                  const HomeBanner(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.animateTo(2);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: SECONDARY_COLOR),
                            width: MediaQuery.of(context).size.width,
                            height: 102,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "lib/assets/logo/splash.png",
                                  width: 36,
                                  height: 36,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "어디로 떠나시나요?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "TOP 20 플레이스",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const HotPlaceDetail()));
                              },
                              child: const Text(
                                "더보기",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 175,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: HotPlace(),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 72,
                        color: const Color(0xffe7f3fd),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "댕트립 이용이처음이신가요?\n이용가이드 보기",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black38,
                              ),
                            ),
                            const SizedBox(
                              width: 48,
                            ),
                            Lottie.asset(
                              "lib/assets/lottie/app_lottie.json",
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "갓성비 숙소 !",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const NaverMapTest(),
            const Trip(),
            const Photo(),
            const RestaurantScreen(),
          ],
        ));
  }
}
