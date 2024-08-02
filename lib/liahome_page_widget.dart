// lib/liahome_page_widget.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Adicione isso se você usar animações
import 'package:flutter_flow/flutter_flow_animations.dart'; // Certifique-se de ter essas bibliotecas
import 'package:flutter_flow/flutter_flow_icon_button.dart'; // Certifique-se de ter essas bibliotecas
import 'package:flutter_flow/flutter_flow_theme.dart'; // Certifique-se de ter essas bibliotecas
import 'package:flutter_flow/flutter_flow_util.dart'; // Certifique-se de ter essas bibliotecas
import 'package:flutter_flow/flutter_flow_widgets.dart'; // Certifique-se de ter essas bibliotecas

import 'liahome_page_model.dart';
import '/components/avegatebar_widget.dart';

class LIAhomePAGEWidget extends StatefulWidget {
  const LIAhomePAGEWidget({Key? key}) : super(key: key);

  @override
  State<LIAhomePAGEWidget> createState() => _LIAhomePAGEWidgetState();
}

class _LIAhomePAGEWidgetState extends State<LIAhomePAGEWidget> with TickerProviderStateMixin {
  late LIAhomePAGEModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LIAhomePAGEModel());

    animationsMap.addAll({
      'pageViewOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: Color(0xFFC5C5AD),
        drawer: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                title: Text(
                  'Title',
                  style: GoogleFonts.outfit(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Subtitle goes here...',
                  style: GoogleFonts.readexPro(
                    letterSpacing: 0,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                tileColor: Color(0xFFFFDC95),
                dense: false,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF50723C),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'LIA',
            style: GoogleFonts.outfit(
              letterSpacing: 0,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 340,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: PageView(
                        controller: _model.pageViewController ??= PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '',
                              width: 300,
                              height: 200,
                              fit: BoxFit.fill,
                              alignment: Alignment(0, 0),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '',
                              width: 300,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '',
                              width: 300,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '',
                              width: 300,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                        child: SmoothPageIndicator(
                          controller: _model.pageViewController ??= PageController(initialPage: 0),
                          count: 4,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            setState(() {});
                          },
                          effect: ExpandingDotsEffect(
                            expansionFactor: 3,
                            spacing: 8,
                            radius: 16,
                            dotWidth: 16,
                            dotHeight: 8,
                            dotColor: Color(0xFF50723C),
                            activeDotColor: Color(0xFF50723C),
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animateOnActionTrigger(
                animationsMap['pageViewOnActionTriggerAnimation']!,
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: wrapWithModel(
                    model: _model.avegatebarModel,
                    updateCallback: () => setState(() {}),
                    child: AvegatebarWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
