import '/flutter_flow/flutter_flow_util.dart';
import 's_score_widget.dart' show SScoreWidget;
import 'package:flutter/material.dart';

class SScoreModel extends FlutterFlowModel<SScoreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
