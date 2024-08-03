import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class LIAhomePAGEWidget extends StatefulWidget {
  const LIAhomePAGEWidget({super.key});

  @override
  State<LIAhomePAGEWidget> createState() => _LIAhomePAGEWidgetState();
}

class _LIAhomePAGEWidgetState extends State<LIAhomePAGEWidget> with TickerProviderStateMixin {
  PageController? _pageViewController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    letterSpacing: 0,
                  ),
                ),
                subtitle: Text(
                  'Subtitle goes here...',
                  style: GoogleFonts.readexPro(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    letterSpacing: 0,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
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
            icon: Icon(Icons.menu, color: Theme.of(context).primaryColor, size: 30),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
          title: Text(
            'LIA',
            style: GoogleFonts.outfit(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              letterSpacing: 0,
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
                        controller: _pageViewController,
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
                          controller: _pageViewController!,
                          count: 4,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _pageViewController!.animateToPage(
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
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Placeholder(), // Replace with your custom widget
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
