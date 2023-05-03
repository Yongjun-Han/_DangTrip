import 'package:flutter/material.dart';

class PlaceInfoCard extends StatelessWidget {
  // 썸네일
  final Widget image;
  //상호명
  final String name;
  //견종
  // final String dogType;
  //태그
  final String area;
  //평점
  final double ratings;
  //상세페이지 여부
  final bool isDetail;

  const PlaceInfoCard({
    required this.image,
    required this.name,
    required this.area,
    required this.ratings,
    this.isDetail = false,
    // required this.dogType,
    super.key,
  });

  // factory PlaceInfoCard.fromModel({
  //   required PlaceInfoModel model,
  //   bool isDetail = false,
  // }) {
  //   return PlaceInfoCard(
  //     image: Image.asset(
  //       'lib/assets/banner/detail_test.png',
  //       fit: BoxFit.cover,
  //       height: 250,
  //       width: MediaQuery.of(context).size.width,
  //     ),
  //     name: model.title,
  //     area: model.areaName,
  //     ratings: 4.7,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetail) image,
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image,
          ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(ratings.toString()),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    area,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DogType extends StatelessWidget {
  final String type;

  const DogType({
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'lib/assets/logo/dogType.png',
          fit: BoxFit.cover,
          scale: 2,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          type,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
