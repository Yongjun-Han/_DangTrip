import 'package:flutter/material.dart';

import '../widgets/banner_slide.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    // print(webtoons);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeBanner(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items:),
      // floatingActionButton: SizedBox(
      //   width: 72,
      //   height: 72,
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //       onPressed: () {},
      //       backgroundColor: const Color(0xffA9A8D3),
      //       child: const RotatedBox(
      //         quarterTurns: 1,
      //         child: Icon(Icons.route_outlined),
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   notchMargin: 10,
      //   shape: const CircularNotchedRectangle(),
      //   color: const Color(0xff807ec2),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             width: MediaQuery.of(context).size.width / 2,
      //             height: 56,
      //             decoration: BoxDecoration(
      //               border: Border.all(),
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 const SizedBox(
      //                   width: 20,
      //                 ),
      //                 IconButton(
      //                   onPressed: () {},
      //                   icon: const Icon(Icons.home_filled),
      //                   color: Colors.white,
      //                 ),
      //                 const SizedBox(
      //                   width: 16,
      //                 ),
      //                 IconButton(
      //                   onPressed: () {},
      //                   icon: const Icon(Icons.map_outlined),
      //                   color: Colors.white,
      //                 )
      //               ],
      //             ),
      //           ),
      //           Container(
      //             height: 56,
      //             width: MediaQuery.of(context).size.width / 2,
      //             decoration: BoxDecoration(
      //               border: Border.all(),
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 IconButton(
      //                   onPressed: () {},
      //                   icon: const Icon(Icons.photo_camera_back),
      //                   color: Colors.white,
      //                 ),
      //                 const SizedBox(
      //                   width: 16,
      //                 ),
      //                 IconButton(
      //                   onPressed: () {},
      //                   icon: const Icon(Icons.favorite_border_outlined),
      //                   color: Colors.white,
      //                 ),
      //                 const SizedBox(
      //                   width: 20,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
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
