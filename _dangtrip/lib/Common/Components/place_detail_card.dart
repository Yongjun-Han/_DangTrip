import 'package:_dangtrip/Common/const/colors.dart';
import 'package:flutter/material.dart';

class PlaceDetailCard extends StatelessWidget {
  //썸네일
  final Widget image;
  //상호명
  final String name;
  //평점
  final double ratings;
  //주소
  final String address;
  //견종
  final String dogtype;
  //주차여부
  final bool parkinglot;
  //와이파이
  final bool wifi;
  //가게소개
  final String placeinfo;
  //연락처
  final String tel;
  //홈페이지
  final String link;
  //키워드
  final String keyword;
  //주요시설
  final String mainFacility;

  const PlaceDetailCard({
    required this.image,
    required this.name,
    required this.ratings,
    required this.address,
    required this.dogtype,
    required this.parkinglot,
    required this.wifi,
    required this.placeinfo,
    required this.tel,
    required this.link,
    required this.keyword,
    required this.mainFacility,
    super.key,
  });

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
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            //가게명 주소 평점
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
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.star,
                            size: 14,
                          ),
                          Text(
                            ratings.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                          color: PRIMARY_COLOR,
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
              height: 16,
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
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                dogtype,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
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
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              if (parkinglot)
                                const Text(
                                  '주차가능',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (!parkinglot)
                                const Text(
                                  '주차불가',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
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
                                Icons.wifi,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              if (wifi)
                                const Text(
                                  '무선인터넷 제공',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (!wifi)
                                const Text(
                                  '무선인터넷 없음',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
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
                    placeinfo,
                    maxLines: 2,
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
                  const Text(
                    '음식점>카페,디저트',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffafafaf),
                    ),
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
                  const Text(
                    '042-1234-5678',
                    style: TextStyle(
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
                  const Text(
                    'https://blog.naver.com/qhfus1103/222926664940',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 14,
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
                  const Text(
                    '대전광역시 서구 도솔로 291 1층 디얼투데이',
                    style: TextStyle(
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
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
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
