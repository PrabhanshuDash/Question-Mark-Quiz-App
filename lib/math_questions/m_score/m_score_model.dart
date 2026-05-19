import '/flutter_flow/flutter_flow_util.dart';
import 'm_score_widget.dart' show MScoreWidget;
import 'package:flutter/material.dart';

class MScoreModel extends FlutterFlowModel<MScoreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
