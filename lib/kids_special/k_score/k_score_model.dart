import '/flutter_flow/flutter_flow_util.dart';
import 'k_score_widget.dart' show KScoreWidget;
import 'package:flutter/material.dart';

class KScoreModel extends FlutterFlowModel<KScoreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
