import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "course" field.
  String? _course;
  String get course => _course ?? '';
  bool hasCourse() => _course != null;

  // "classroom" field.
  String? _classroom;
  String get classroom => _classroom ?? '';
  bool hasClassroom() => _classroom != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "attended" field.
  int? _attended;
  int get attended => _attended ?? 0;
  bool hasAttended() => _attended != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  bool hasTotal() => _total != null;

  // "schedule" field.
  List<DayTimeStruct>? _schedule;
  List<DayTimeStruct> get schedule => _schedule ?? const [];
  bool hasSchedule() => _schedule != null;

  // "days" field.
  List<String>? _days;
  List<String> get days => _days ?? const [];
  bool hasDays() => _days != null;

  void _initializeFields() {
    _course = snapshotData['course'] as String?;
    _classroom = snapshotData['classroom'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _attended = castToType<int>(snapshotData['attended']);
    _total = castToType<int>(snapshotData['total']);
    _schedule = getStructList(
      snapshotData['schedule'],
      DayTimeStruct.fromMap,
    );
    _days = getDataList(snapshotData['days']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? course,
  String? classroom,
  DocumentReference? uid,
  int? attended,
  int? total,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course': course,
      'classroom': classroom,
      'uid': uid,
      'attended': attended,
      'total': total,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.course == e2?.course &&
        e1?.classroom == e2?.classroom &&
        e1?.uid == e2?.uid &&
        e1?.attended == e2?.attended &&
        e1?.total == e2?.total &&
        listEquality.equals(e1?.schedule, e2?.schedule) &&
        listEquality.equals(e1?.days, e2?.days);
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.course,
        e?.classroom,
        e?.uid,
        e?.attended,
        e?.total,
        e?.schedule,
        e?.days
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
