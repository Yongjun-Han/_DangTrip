import 'package:_dangtrip/Common/Utils/cateModel.dart';
import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/Utils/select_notifier_provider.dart';
import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/widgets/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Trip extends ConsumerWidget {
  const Trip({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CategoryModel> selectState = ref.watch(selectProvider);

    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe1e1e1)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search_rounded,
                        color: Color(0xffe1e1e1),
                        size: 24,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            '어디로 떠나시나요 ?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: TEXT_INPUT_BORDER_COLOR,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 41,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: selectState
                      .map(
                        (e) => Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                ref.read(categoryProvider.notifier).update(
                                  (state) {
                                    late String placecategory;
                                    if (e.name == '식음료') {
                                      placecategory = 'PC01';
                                    } else if (e.name == '숙박') {
                                      placecategory = 'PC02';
                                    } else if (e.name == '관광지') {
                                      placecategory = 'PC03';
                                    } else if (e.name == '체험') {
                                      placecategory = 'PC04';
                                    } else if (e.name == '동물병원') {
                                      placecategory = 'PC05';
                                    }
                                    return placecategory;
                                  },
                                );
                                ref
                                    .read(selectProvider.notifier)
                                    .isSelected(name: e.name);
                              },
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0),
                                backgroundColor: MaterialStatePropertyAll(
                                    e.isSelected ? PRIMARY_COLOR : TEXT_DIMMED),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(e.name),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 2,
                color: const Color(0xfff6f6f6),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffeeeeee),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 8, right: 16, bottom: 8),
                      child: Row(
                        children: [
                          Text("견종"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: PRIMARY_COLOR,
                    ),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text(
                          "거리순",
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: PRIMARY_COLOR,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const PlaceListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
