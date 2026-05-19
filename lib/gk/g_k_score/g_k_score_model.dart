import '/flutter_flow/flutter_flow_util.dart';
import 'g_k_score_widget.dart' show GKScoreWidget;
import 'package:flutter/material.dart';

class GKScoreModel extends FlutterFlowModel<GKScoreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
