import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/screens/maps.dart';
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
            const Column(
              children: [
                HomeBanner(),
              ],
            ),
            const Center(child: NaverMapTest()),
            const Trip(),
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

// class Travel extends StatelessWidget {
//   const Travel({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
//           child: Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: const Color(0xffe1e1e1)),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.search_rounded,
//                         color: Color(0xffe1e1e1),
//                         size: 24,
//                       ),
//                       TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             '어디로 떠나시나요 ?',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xffe1e1e1),
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               PlaceInfoCard(
//                 image: Image.asset(
//                   'lib/assets/event/kanu_dog.jpg',
//                   fit: BoxFit.cover,
//                 ),
//                 name: '카누하개',
//                 tags: const ['반려견 동반', '무료주차', 'wifi'],
//                 ratings: 4.7,
//                 // dogType: '소형견',
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // 