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
  '식음료',
  '숙박',
  '관광지',
  '체험',
  '동물병원',
];

final List<IconData> categoryIcon = [
  Icons.local_dining_outlined,
  Icons.bed,
  Icons.travel_explore_rounded,
  Icons.fence_rounded,
  Icons.local_hospital_rounded,
];
