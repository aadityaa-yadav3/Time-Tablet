// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayTimeStruct extends FFFirebaseStruct {
  DayTimeStruct({
    String? timeStart,
    String? timeEnd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timeStart = timeStart,
        _timeEnd = timeEnd,
        super(firestoreUtilData);

  // "timeStart" field.
  String? _timeStart;
  String get timeStart => _timeStart ?? '';
  set timeStart(String? val) => _timeStart = val;

  bool hasTimeStart() => _timeStart != null;

  // "timeEnd" field.
  String? _timeEnd;
  String get timeEnd => _timeEnd ?? '';
  set timeEnd(String? val) => _timeEnd = val;

  bool hasTimeEnd() => _timeEnd != null;

  static DayTimeStruct fromMap(Map<String, dynamic> data) => DayTimeStruct(
        timeStart: data['timeStart'] as String?,
        timeEnd: data['timeEnd'] as String?,
      );

  static DayTimeStruct? maybeFromMap(dynamic data) =>
      data is Map ? DayTimeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'timeStart': _timeStart,
        'timeEnd': _timeEnd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timeStart': serializeParam(
          _timeStart,
          ParamType.String,
        ),
        'timeEnd': serializeParam(
          _timeEnd,
          ParamType.String,
        ),
      }.withoutNulls;

  static DayTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DayTimeStruct(
        timeStart: deserializeParam(
          data['timeStart'],
          ParamType.String,
          false,
        ),
        timeEnd: deserializeParam(
          data['timeEnd'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DayTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DayTimeStruct &&
        timeStart == other.timeStart &&
        timeEnd == other.timeEnd;
  }

  @override
  int get hashCode => const ListEquality().hash([timeStart, timeEnd]);
}

DayTimeStruct createDayTimeStruct({
  String? timeStart,
  String? timeEnd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DayTimeStruct(
      timeStart: timeStart,
      timeEnd: timeEnd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DayTimeStruct? updateDayTimeStruct(
  DayTimeStruct? dayTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dayTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDayTimeStructData(
  Map<String, dynamic> firestoreData,
  DayTimeStruct? dayTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dayTime == null) {
    return;
  }
  if (dayTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dayTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dayTimeData = getDayTimeFirestoreData(dayTime, forFieldValue);
  final nestedData = dayTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dayTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDayTimeFirestoreData(
  DayTimeStruct? dayTime, [
  bool forFieldValue = false,
]) {
  if (dayTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dayTime.toMap());

  // Add any Firestore field values
  dayTime.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDayTimeListFirestoreData(
  List<DayTimeStruct>? dayTimes,
) =>
    dayTimes?.map((e) => getDayTimeFirestoreData(e, true)).toList() ?? [];
