import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ScienceQuestionsRecord extends FirestoreRecord {
  ScienceQuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "questions" field.
  String? _questions;
  String get questions => _questions ?? '';
  bool hasQuestions() => _questions != null;

  void _initializeFields() {
    _questions = snapshotData['questions'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ScienceQuestions');

  static Stream<ScienceQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScienceQuestionsRecord.fromSnapshot(s));

  static Future<ScienceQuestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ScienceQuestionsRecord.fromSnapshot(s));

  static ScienceQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScienceQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScienceQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScienceQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScienceQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScienceQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScienceQuestionsRecordData({
  String? questions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questions': questions,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScienceQuestionsRecordDocumentEquality
    implements Equality<ScienceQuestionsRecord> {
  const ScienceQuestionsRecordDocumentEquality();

  @override
  bool equals(ScienceQuestionsRecord? e1, ScienceQuestionsRecord? e2) {
    return e1?.questions == e2?.questions;
  }

  @override
  int hash(ScienceQuestionsRecord? e) =>
      const ListEquality().hash([e?.questions]);

  @override
  bool isValidKey(Object? o) => o is ScienceQuestionsRecord;
}
