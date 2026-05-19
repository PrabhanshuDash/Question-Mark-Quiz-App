import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _option1 = '';
  String get option1 => _option1;
  set option1(String value) {
    _option1 = value;
  }

  String _option2 = '';
  String get option2 => _option2;
  set option2(String value) {
    _option2 = value;
  }

  String _option3 = '';
  String get option3 => _option3;
  set option3(String value) {
    _option3 = value;
  }

  String _option4 = '';
  String get option4 => _option4;
  set option4(String value) {
    _option4 = value;
  }

  int _completedQuestion = 0;
  int get completedQuestion => _completedQuestion;
  set completedQuestion(int value) {
    _completedQuestion = value;
  }

  int _score = 0;
  int get score => _score;
  set score(int value) {
    _score = value;
  }
}
