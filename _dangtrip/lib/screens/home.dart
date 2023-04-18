import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/layout/default_layout.dart';
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
              icon: Icon(Icons.favorite_border_outlined),
              label: 'MY',
            ),
          ],
        ),
        child: TabBarView(
          //좌우 스크롤 고정
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            Center(
              child: Container(
                child: const Text('홈'),
              ),
            ),
            Center(
              child: Container(
                child: const Text('주변'),
              ),
            ),
            Center(
              child: Container(
                child: const Text('여행'),
              ),
            ),
            Center(
              child: Container(
                child: const Text('댕생네컷'),
              ),
            ),
            Center(
              child: Container(
                child: const Text('MY'),
              ),
            ),
          ],
        ));
  }
}

// 