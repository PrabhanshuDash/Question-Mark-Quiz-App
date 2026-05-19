// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Question1Struct extends FFFirebaseStruct {
  Question1Struct({
    String? question,
    List<String>? options,
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _options = options,
        _answer = answer,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;
  void updateOptions(Function(List<String>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;
  bool hasAnswer() => _answer != null;

  static Question1Struct fromMap(Map<String, dynamic> data) => Question1Struct(
        question: data['question'] as String?,
        options: getDataList(data['options']),
        answer: data['answer'] as String?,
      );

  static Question1Struct? maybeFromMap(dynamic data) => data is Map
      ? Question1Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'options': _options,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          true,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static Question1Struct fromSerializableMap(Map<String, dynamic> data) =>
      Question1Struct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'Question1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is Question1Struct &&
        question == other.question &&
        listEquality.equals(options, other.options) &&
        answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([question, options, answer]);
}

Question1Struct createQuestion1Struct({
  String? question,
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    Question1Struct(
      question: question,
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

Question1Struct? updateQuestion1Struct(
  Question1Struct? question1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    question1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestion1StructData(
  Map<String, dynamic> firestoreData,
  Question1Struct? question1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (question1 == null) {
    return;
  }
  if (question1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && question1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final question1Data = getQuestion1FirestoreData(question1, forFieldValue);
  final nestedData = question1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = question1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestion1FirestoreData(
  Question1Struct? question1, [
  bool forFieldValue = false,
]) {
  if (question1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(question1.toMap());

  // Add any Firestore field values
  question1.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestion1ListFirestoreData(
  List<Question1Struct>? question1s,
) =>
    question1s?.map((e) => getQuestion1FirestoreData(e, true)).toList() ?? [];
