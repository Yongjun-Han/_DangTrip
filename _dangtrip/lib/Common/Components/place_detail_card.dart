import 'package:_dangtrip/Common/const/colors.dart';
import 'package:flutter/material.dart';

class PlaceDetailCard extends StatelessWidget {
  // //썸네일
  // final Widget image;
  // //상호명
  // final String name;
  // //평점
  // final double ratings;
  // //주소
  // final String address;
  // //견종
  // final String dogtype;
  // //주차여부
  // final bool parkinglot;
  // //와이파이
  // final bool wifi;
  // //가게소개
  // final String placeinfo;
  // //연락처
  // final String tel;
  // //홈페이지
  // final String link;

  const PlaceDetailCard({
    // required this.image,
    // required this.name,
    // required this.ratings,
    // required this.address,
    // required this.dogtype,
    // required this.parkinglot,
    // required this.wifi,
    // required this.placeinfo,
    // required this.tel,
    // required this.link,
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
                Image.asset('lib/assets/banner/detail_test.png'),
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
                        children: const [
                          Text(
                            '디얼투데이',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                          ),
                          Text(
                            '4.7',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        '대전 서구 도솔로291 1층 디얼투데이',
                        style: TextStyle(
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
                              const Text(
                                '중형견',
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
                              Image.asset(
                                'lib/assets/logo/parking.png',
                                width: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '주차가능',
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
                            children: const [
                              Icon(
                                Icons.wifi,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '무선인터넷 제공',
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
                  const Text(
                    '야외정원이 있는 주택개조 카페로 커피와 음료 그리고 디저트와 베이커리도 판매하는 애견동반가능 카페입니다',
                    style: TextStyle(
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
