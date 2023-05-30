import 'package:_dangtrip/Common/const/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    //옆의 이미지가 높아도 각각의 위젯은 고유의 높이를 가지기 때문에 늘려주어야 한다
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              "lib/assets/banner/AD_3.png",
              fit: BoxFit.cover,
              width: 110,
              height: 110,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "대왕연어초밥",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "연어초밥의 정석연어초밥의 정석연어초밥의 정석연어초밥의 정석 정석정석연어초밥의 정석 정석정석연어초밥의 정석 정석정석연어초밥의 정석 정석",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TEXT_SUB,
                  ),
                ),
                Text(
                  "14000원",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: PRIMARY_COLOR,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
