// import 'package:_dangtrip/Common/Components/place_info_card.dart';
// import 'package:_dangtrip/Common/Utils/cateModel.dart';
// import 'package:_dangtrip/Common/Utils/place_provider.dart';
// import 'package:_dangtrip/Common/Utils/place_state_noti.dart';
// import 'package:_dangtrip/Common/Utils/select_notifier_provider.dart';
// import 'package:_dangtrip/Common/const/colors.dart';
// import 'package:_dangtrip/screens/place_detail_screen.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class Trip extends ConsumerWidget {
//   const Trip({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final data = ref.watch(PlaceProvider);
//     if (data.isEmpty) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     //썸네일 요청용
//     Future<List<dynamic>> getThumb(String pcCode) async {
//       late List thumbArr = [];
//       final dio = Dio();
//       if (pcCode == 'PC05') {
//         for (int i = 0; i < data.length; i++) {
//           thumbArr.add(
//               "https://plus.unsplash.com/premium_photo-1661954422066-36639b6f13b5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2338&q=80");
//         }
//       } else {
//         for (int i = 0; i < data.length; i++) {
//           await dio
//               .get(
//                   'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${data[i].contentSeq}')
//               .then((value) {
//             thumbArr.add(
//                 value.data[0]['resultList']['imageList'][0]['image']); //이미지 링크
//           });
//         }
//       }
//       return thumbArr;
//     }

//     final categoryState = ref.watch(categoryProvider);
//     final pageState = ref.watch(contentPageProvider);
//     final List<CategoryModel> selectState = ref.watch(selectProvider);

//     return Center(
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
//           child: Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: const Color(0xffe1e1e1)),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.search_rounded,
//                         color: Color(0xffe1e1e1),
//                         size: 24,
//                       ),
//                       TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             '어디로 떠나시나요 ?',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                               color: TEXT_INPUT_BORDER_COLOR,
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               SizedBox(
//                 height: 41,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: selectState
//                       .map(
//                         (e) => Row(
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 ref.read(categoryProvider.notifier).update(
//                                   (state) {
//                                     late String placecategory;
//                                     if (e.name == '식음료') {
//                                       placecategory = 'PC01';
//                                     } else if (e.name == '숙박') {
//                                       placecategory = 'PC02';
//                                     } else if (e.name == '관광지') {
//                                       placecategory = 'PC03';
//                                     } else if (e.name == '체험') {
//                                       placecategory = 'PC04';
//                                     } else if (e.name == '동물병원') {
//                                       placecategory = 'PC05';
//                                     }
//                                     return placecategory;
//                                   },
//                                 );
//                                 ref
//                                     .read(selectProvider.notifier)
//                                     .isSelected(name: e.name);
//                               },
//                               style: ButtonStyle(
//                                 elevation: const MaterialStatePropertyAll(0),
//                                 backgroundColor: MaterialStatePropertyAll(
//                                     e.isSelected ? PRIMARY_COLOR : TEXT_DIMMED),
//                               ),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 4),
//                                 child: Text(e.name),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 16,
//                             )
//                           ],
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 height: 2,
//                 color: const Color(0xfff6f6f6),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: const Color(0xffeeeeee),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.only(
//                           left: 20, top: 8, right: 16, bottom: 8),
//                       child: Row(
//                         children: [
//                           Text("견종"),
//                           Icon(Icons.arrow_drop_down_rounded)
//                         ],
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     style: TextButton.styleFrom(
//                       foregroundColor: PRIMARY_COLOR,
//                     ),
//                     onPressed: () {},
//                     child: const Row(
//                       children: [
//                         Text(
//                           "거리순",
//                           style: TextStyle(color: PRIMARY_COLOR),
//                         ),
//                         Icon(
//                           Icons.arrow_drop_down_rounded,
//                           color: PRIMARY_COLOR,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               Consumer(
//                 builder: (context, ref, child) {
//                   return Expanded(
//                     child: ListView.separated(
//                       itemCount: data.length,
//                       itemBuilder: (_, index) {
//                         final item = data[index];
//                         // final thumbItem = getThumb(categoryState);
//                         //장소 카드 리스트의 카드
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (_) => PlaceDetailScreen(
//                                   contentSeq: item.contentSeq,
//                                   partName: item.partName,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: PlaceInfoCard(
//                             contentSeq: item.contentSeq,
//                             image: FutureBuilder(
//                               future: getThumb(categoryState),
//                               builder: (context, snapshot) {
//                                 if (!snapshot.hasData) {
//                                   return Container(
//                                     height: 250,
//                                     width: MediaQuery.of(context).size.width,
//                                     color: const Color.fromARGB(
//                                         255, 234, 234, 234),
//                                   );
//                                 }
//                                 return Image.network(
//                                   snapshot.data![index],
//                                   fit: BoxFit.cover,
//                                   height: 250,
//                                   width: MediaQuery.of(context).size.width,
//                                 );
//                               },
//                             ),
//                             name: item.title,
//                             area: item.areaName,
//                             ratings: 4.7,
//                           ),
//                         );
//                         // model: parsedItem,
//                       },
//                       separatorBuilder: (_, index) {
//                         return const SizedBox(
//                           height: 8,
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
