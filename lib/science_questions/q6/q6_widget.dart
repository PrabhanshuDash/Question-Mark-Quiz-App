import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'q6_model.dart';
export 'q6_model.dart';

class Q6Widget extends StatefulWidget {
  const Q6Widget({
    super.key,
    this.isTrue,
    this.isAnswered,
  });

  final bool? isTrue;
  final bool? isAnswered;

  @override
  State<Q6Widget> createState() => _Q6WidgetState();
}

class _Q6WidgetState extends State<Q6Widget> {
  late Q6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Q6Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 92.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowTimer(
                          initialTime: _model.timerMilliseconds,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            milliSecond: false,
                          ),
                          controller: _model.timerController,
                          updateStateInterval: const Duration(milliseconds: 1000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) setState(() {});
                          },
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'gohq0j67' /* Question 6 */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    LinearPercentIndicator(
                      percent: 0.692,
                      width: MediaQuery.sizeOf(context).width * 0.92,
                      lineHeight: 12.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: const Color(0xFF97DAEA),
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      barRadius: const Radius.circular(92.0),
                      padding: EdgeInsets.zero,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'r0qowg1l' /* What is the hardest natural su... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (widget.isAnswered!) {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              } else {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  'Diamond' == _model.answer
                                      ? colorFromCssString(
                                          widget.isAnswered!.toString(),
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        )
                                      : const Color(0xB4EB070C),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 16.0, 12.0, 16.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'm3atmkjb' /* Wood
 */
                                    ,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (widget.isAnswered!) {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              } else {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  'Diamond' == _model.answer
                                      ? colorFromCssString(
                                          widget.isAnswered!.toString(),
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        )
                                      : const Color(0xB4EB070C),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 16.0, 12.0, 16.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ujnkgcpp' /*  Iron */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (widget.isAnswered!) {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              } else {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  'Diamond' == _model.answer
                                      ? colorFromCssString(
                                          widget.isAnswered!.toString(),
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        )
                                      : FlutterFlowTheme.of(context).secondary,
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 16.0, 12.0, 16.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5g8mg85c' /* Diamond */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (widget.isAnswered!) {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              } else {
                                setState(() {
                                  _model.answer = 'MARS';
                                });
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  'Diamond' == _model.answer
                                      ? colorFromCssString(
                                          widget.isAnswered!.toString(),
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        )
                                      : const Color(0xB4EB070C),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 16.0, 12.0, 16.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '1ll8q60x' /* Glass */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 35.0)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.goNamed(
                            'Q7',
                            queryParameters: {
                              'isTrue': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                              'isAnswered': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '2a9gb4ux' /* Next */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF97DAEA),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 45.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
