import 'package:_dangtrip/Common/const/colors.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  // final Widget? bottomNavigationBar;

  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: PRIMARY_COLOR,
      unselectedItemColor: TEXT_DIMMED,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          this.index = index;
        });
      },
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: '주변'),
        BottomNavigationBarItem(
            icon: Icon(Icons.route_outlined), label: '여행짜기'),
        BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_back), label: '댕생네컷'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined), label: 'MY'),
      ],
    );
  }
}

// child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.home),
//               disabledColor: const Color(0xffA9A8D3),
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     fullscreenDialog: true,
//                     builder: (context) => const Maps(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.map_outlined),
//               disabledColor: const Color(0xffA9A8D3),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.photo_camera_back),
//               disabledColor: const Color(0xffA9A8D3),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.favorite_border_outlined),
//               disabledColor: const Color(0xffA9A8D3),
//             ),
//           ],
//         ),
