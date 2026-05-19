import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class Option4Record extends FirestoreRecord {
  Option4Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "option" field.
  String? _option;
  String get option => _option ?? '';
  bool hasOption() => _option != null;

  // "is_true" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  bool hasIsTrue() => _isTrue != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _option = snapshotData['option'] as String?;
    _isTrue = snapshotData['is_true'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('option4')
          : FirebaseFirestore.instance.collectionGroup('option4');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('option4').doc(id);

  static Stream<Option4Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Option4Record.fromSnapshot(s));

  static Future<Option4Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Option4Record.fromSnapshot(s));

  static Option4Record fromSnapshot(DocumentSnapshot snapshot) =>
      Option4Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Option4Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Option4Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Option4Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Option4Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOption4RecordData({
  String? option,
  bool? isTrue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'option': option,
      'is_true': isTrue,
    }.withoutNulls,
  );

  return firestoreData;
}

class Option4RecordDocumentEquality implements Equality<Option4Record> {
  const Option4RecordDocumentEquality();

  @override
  bool equals(Option4Record? e1, Option4Record? e2) {
    return e1?.option == e2?.option && e1?.isTrue == e2?.isTrue;
  }

  @override
  int hash(Option4Record? e) =>
      const ListEquality().hash([e?.option, e?.isTrue]);

  @override
  bool isValidKey(Object? o) => o is Option4Record;
}
