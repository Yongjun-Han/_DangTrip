import 'package:_dangtrip/Common/const/colors.dart';
import 'package:flutter/material.dart';

class HotPlaceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int rank;

  const HotPlaceCard({
    required this.title,
    required this.imageUrl,
    required this.rank,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (rank == 0)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 148,
                  height: 148,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 5,
                width: 32,
                height: 32,
                child: Image.asset(
                  'lib/assets/logo/firstrank.png',
                  color: PRIMARY_COLOR,
                ),
              ),
            ],
          ),
        if (rank != 0)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 148,
              height: 148,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              "${rank + 1}#",
              style: TextStyle(
                color: rank == 0 || rank == 1
                    ? PRIMARY_COLOR
                    : const Color.fromARGB(255, 74, 74, 74),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            SizedBox(
              width: 120,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 74, 74, 74),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        )
      ],
    );
  }
}
