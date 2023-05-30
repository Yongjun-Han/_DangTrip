import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  //썸네일 이미지
  final Widget image;
  //가게 이름
  final String name;
  //레스토랑 태그
  final List<String> tags;
  //평점 , 배달시간, 배달팁
  final int ratingsCount, deliveryTime, deliveryFee;
  //평점
  final double ratings;
  //상세 페이지 여부
  final bool isDetail;
  //상세 내용
  final String? detail;

  const RestaurantCard({
    required this.image,
    required this.name,
    required this.tags,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratings,
    this.isDetail = false,
    this.detail,
    super.key,
  });

  factory RestaurantCard.fromModel({
    required RestaurantModel model,
    bool isDetail = false,
  }) {
    return RestaurantCard(
      image: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
      isDetail: isDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //디테일 페이지면 이미지 좌우 여백 없음
        if (isDetail) image,
        //디테일 페이지가 아니면 이미지 좌우 여백
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image,
          ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16 : 4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ratings.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    tags.join(" · "),
                    style: const TextStyle(color: TEXT_SUB),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  _IconText(
                    icon: Icons.star,
                    label: ratings.toString(),
                  ),
                  _IconText(
                    icon: Icons.receipt,
                    label: ratingsCount.toString(),
                  ),
                  _IconText(
                    icon: Icons.timelapse,
                    label: "$deliveryTime 분",
                  ),
                  _IconText(
                    icon: Icons.motorcycle_rounded,
                    label: deliveryFee == 0 ? "무료" : deliveryFee.toString(),
                  )
                ],
              ),
              if (detail != null && isDetail)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Text(detail!),
                ),
            ],
          ),
        )
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
