// import 'dart:convert';

import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/model/restaurant_model.dart';
import 'package:flutter/material.dart';

class PlaceInfoCard extends StatelessWidget {
  // 썸네일
  final Widget image;
  //상호명
  final String name;
  //견종
  // final String dogType;
  //태그
  final List<String> tags;
  //평점
  final double ratings;

  const PlaceInfoCard({
    required this.image,
    required this.name,
    required this.tags,
    required this.ratings,
    // required this.dogType,
    super.key,
  });

  factory PlaceInfoCard.fromModel({
    required RestaurantModel model,
  }) {
    return PlaceInfoCard(
      image: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratings: model.ratings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tags.join(' · '),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: PRIMARY_COLOR,
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
