import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LIAhomePAGEWidget extends StatefulWidget {
  const LIAhomePAGEWidget({super.key});

  @override
  State<LIAhomePAGEWidget> createState() => _LIAhomePAGEWidgetState();
}

class _LIAhomePAGEWidgetState extends State<LIAhomePAGEWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFC5C5AD),
        drawer: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                title: Text(
                  'Title',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  'Subtitle goes here...',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  size: 20,
                ),
                tileColor: Color.fromARGB(255, 0, 0, 0),
                dense: false,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF50723C),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu, color: const Color.fromARGB(255, 0, 0, 0), size: 30),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
          title: Text(
            'LIA',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: PageView(
                        controller: pageViewController ??= PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '',
                              width: 300,
                              height: 200,
                              fit: BoxFit.fill,
                              alignment: const Alignment(0, 0),
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
                      alignment: const AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                        child: SmoothPageIndicator(
                          controller: pageViewController ??= PageController(initialPage: 0),
                          count: 4,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await pageViewController!.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            setState(() {});
                          },
                          effect: const ExpandingDotsEffect(
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
                  alignment: const AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.home, color: Color(0xFF50723C), size: 30),
                          onPressed: () {
                            // Handle home button press
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.book_outlined, color: Color(0xFF50723C), size: 30),
                          onPressed: () {
                            // Handle search button press
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt_sharp, color: Color(0xFF50723C), size: 30),
                          onPressed: () {
                            // Handle profile button press
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.back_hand_outlined, color: Color(0xFF50723C), size: 30),
                          onPressed: () {
                            // Handle profile button press
                          },
                        ),
                      ],
                    ),
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
