import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

const storage = FlutterSecureStorage();

//플랫폼별  localhost
const emulatorIp = '10.0.2.2:3000';
const simulatorIp = '127.0.0.1:3000';

final ip = Platform.isIOS ? simulatorIp : emulatorIp;

final List<String> category = [
  '식당',
  '카페',
  '숙박',
  '동물병원',
  '공원',
  '애견운동장',
  '미용',
  '위탁관리업',
  '관광지',
  '놀이터',
];

final List<IconData> categoryIcon = [
  Icons.local_dining_outlined,
  Icons.emoji_food_beverage_rounded,
  Icons.bed,
  Icons.local_hospital_rounded,
  Icons.park_rounded,
  Icons.fence_rounded,
  Icons.content_cut_rounded,
  Icons.home_work_outlined,
  Icons.travel_explore_rounded,
  Icons.local_play_rounded,
];
