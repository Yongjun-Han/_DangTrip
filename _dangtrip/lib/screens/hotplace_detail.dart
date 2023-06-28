import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';

class HotPlaceDetail extends StatelessWidget {
  final Map<String, dynamic> data;
  // final String title;
  // final

  const HotPlaceDetail({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(data);
    return DefaultLayout(
      title: 'TOP 20 플레이스',
      child: Row(
        children: [
          Expanded(
              child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: data['title'].length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => PlaceDetailScreen(
                                    contentSeq: data['seq'][index],
                                    pcCode: "PC01")));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              data['thumbUrl'][index],

                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              // height: MediaQuery.of(context).size.height * 0.75,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Text(
                            data['title'][index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              shadows: [
                                Shadow(color: Colors.black87, blurRadius: 20)
                              ],
                            ),
                          ),
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(8),
                          //   child: Container(
                          //     color: Colors.black,
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 16, vertical: 16),
                          //       child: Text(
                          //         data['title'][index],
                          //         style: const TextStyle(
                          //           fontSize: 18,
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           // backgroundColor: Colors.black,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: index == 0 || index == 1 || index == 2
                                  ? Colors.lightBlueAccent
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: index <= 8
                                    ? Text(
                                        "0${(index + 1).toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: index == 0 ||
                                                    index == 1 ||
                                                    index == 2
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16),
                                      )
                                    : Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, index) {
              return const SizedBox(
                width: 4,
              );
            },
          )),
          const SizedBox(
            height: 48,
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }
}
