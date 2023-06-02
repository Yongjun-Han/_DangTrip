import 'package:_dangtrip/Common/Utils/cateModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectProvider =
    StateNotifierProvider<SelectNotifier, List<CategoryModel>>(
        (ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<List<CategoryModel>> {
  SelectNotifier()
      : super([
          CategoryModel(
            name: '식음료',
            isSelected: true,
          ),
          CategoryModel(
            name: '숙박',
            isSelected: false,
          ),
          CategoryModel(
            name: '관광지',
            isSelected: false,
          ),
          CategoryModel(
            name: '체험',
            isSelected: false,
          ),
          CategoryModel(
            name: '동물병원',
            isSelected: false,
          ),
        ]);

  void isSelected({required String name}) {
    state = state
        .map(
          (e) => e.name == name
              ? CategoryModel(
                  name: e.name,
                  isSelected: !e.isSelected,
                )
              : e,
        )
        .toList();
  }
}

  // void isReleased({required String name}) {
  //   state = state
  //       .map(
  //         (e) => e.name == name
  //             ? e
  //             : CategoryModel(
  //                 name: e.name,
  //                 isSelected: !e.isSelected,
  //               ),
  //       )
  //       .toList();
  // }


// final List<String> category = [
//   '식음료',
//   '숙박',
//   '관광지',
//   '체험',
//   '동물병원',
// ];