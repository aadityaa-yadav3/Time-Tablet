import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool compareTimes(
  DateTime? crrTime,
  String? startTime,
  String? endTime,
) {
  String? crrTimeS = crrTime.toString();
  // crrTimeS = crrTimeS.split[1::];
  crrTimeS = crrTimeS.substring(11, 16);

  int toMinutes(String? time) {
    final parts = time?.split(':');
    final hours = int.parse(parts![0]);
    final minutes = int.parse(parts[1]);
    return hours * 60 + minutes;
  }

  final time2Minutes = toMinutes(crrTimeS);
  final time1Minutes = toMinutes(startTime);
  final time3Minutes = toMinutes(endTime);

  print(time1Minutes);
  print(time2Minutes);
  print(time3Minutes);

  return (time1Minutes <= time2Minutes && time2Minutes <= time3Minutes);
}
