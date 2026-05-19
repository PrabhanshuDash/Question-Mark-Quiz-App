import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class Option1Record extends FirestoreRecord {
  Option1Record._(
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
          ? parent.collection('option1')
          : FirebaseFirestore.instance.collectionGroup('option1');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('option1').doc(id);

  static Stream<Option1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Option1Record.fromSnapshot(s));

  static Future<Option1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Option1Record.fromSnapshot(s));

  static Option1Record fromSnapshot(DocumentSnapshot snapshot) =>
      Option1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Option1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Option1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Option1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Option1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOption1RecordData({
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

class Option1RecordDocumentEquality implements Equality<Option1Record> {
  const Option1RecordDocumentEquality();

  @override
  bool equals(Option1Record? e1, Option1Record? e2) {
    return e1?.option == e2?.option && e1?.isTrue == e2?.isTrue;
  }

  @override
  int hash(Option1Record? e) =>
      const ListEquality().hash([e?.option, e?.isTrue]);

  @override
  bool isValidKey(Object? o) => o is Option1Record;
}
