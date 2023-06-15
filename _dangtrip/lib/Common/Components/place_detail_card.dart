import 'dart:async';

import 'package:_dangtrip/Common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:url_launcher/url_launcher_string.dart';

Completer<NaverMapController> _controller = Completer();

class PlaceDetailCard extends StatelessWidget {
  //썸네일
  final Widget image;
  //상호명,주소,키워드,연락처,영업시간,홈페이지,가게소개,주요시설,메뉴,주의사항,견종
  final String title,
      areaName,
      partName,
      address,
      keyword,
      tel,
      usedTime,
      homePage,
      content,
      mainFacility,
      usedCost,
      policyCautions,
      dogBreed,
      latitude,
      longitude,
      parkingFlag;

  //주차여부

  const PlaceDetailCard({
    required this.image,
    required this.title,
    required this.areaName,
    required this.partName,
    required this.address,
    required this.keyword,
    required this.tel,
    required this.usedTime,
    required this.homePage,
    required this.content,
    required this.mainFacility,
    required this.usedCost,
    required this.policyCautions,
    required this.dogBreed,
    required this.latitude,
    required this.longitude,
    required this.parkingFlag,
    super.key,
  });

  onButtonTap() async {
    await launchUrlString(homePage);
  }

  // void _onMapCreated(NaverMapController controller) {
  //   if (_controller.isCompleted) _controller = Completer();
  //   _controller.complete(controller);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          //썸네일 이미지
          children: [
            Stack(
              children: [
                image,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 56, horizontal: 8),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      size: 32,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black26, blurRadius: 5)],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            //가게명 주소
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const SizedBox(
                          //   width: 16,
                          // ),
                          // Text(
                          //   areaName,
                          //   style: const TextStyle(
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w500,
                          //     color: Colors.grey,
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        address,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Color(0xffff004d),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 122,
                    decoration: BoxDecoration(
                        color: const Color(0xfff1f1f1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'lib/assets/logo/dogType.png',
                                width: 18,
                                color: const Color.fromARGB(255, 92, 92, 92),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              if (dogBreed == 'S')
                                const Text(
                                  '소형견',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                ),
                              if (dogBreed == 'M')
                                const Text(
                                  '중형견',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                ),
                              if (dogBreed == 'L')
                                const Text(
                                  '대형견',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'lib/assets/logo/parking.png',
                                width: 18,
                                color: const Color.fromARGB(255, 92, 92, 92),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              if (parkingFlag == 'Y')
                                const Text(
                                  '주차가능',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                ),
                              if (parkingFlag == 'N')
                                const Text(
                                  '주차불가',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                ),
                              if (parkingFlag == '')
                                const Text(
                                  '업체문의',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 18,
                                color: Color.fromARGB(255, 92, 92, 92),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              if (usedTime == '')
                                const Text(
                                  '업체문의',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                ),
                              if (usedTime != '')
                                SizedBox(
                                  width: 280,
                                  child: Text(
                                    usedTime,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 92, 92, 92),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    '가게정보',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4d4d4d),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Text(
                        '태그 : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        keyword,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: PRIMARY_COLOR,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    '연락처',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xff4d4d4d),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    tel,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff4d4d4d),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    '주요시설',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xff4d4d4d),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    mainFacility,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff4d4d4d),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    '홈페이지',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xff4d4d4d),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: onButtonTap,
                    child: Text(
                      homePage,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    decoration: const BoxDecoration(color: Color(0xffe6e6e6)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    '주의사항',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromARGB(255, 232, 111, 111),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    // policyCautions.substring(0, policyCautions.indexOf(' -')),
                    policyCautions,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff4d4d4d),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    decoration: const BoxDecoration(color: Color(0xffe6e6e6)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    '위치정보',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 204,
                    decoration: BoxDecoration(
                      color: const Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: NaverMap(
                      markers: [
                        Marker(
                          markerId: title,
                          position: LatLng(
                            double.parse(latitude),
                            double.parse(longitude),
                          ),
                        )
                      ],
                      scrollGestureEnable: true,
                      initialCameraPosition: CameraPosition(
                          zoom: 17,
                          target: LatLng(
                              double.parse(latitude), double.parse(longitude))),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.report_problem_outlined,
                        size: 16,
                        color: SECONDARY_COLOR,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '정보 수정 요청하기',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: SECONDARY_COLOR,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
