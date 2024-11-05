import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LIAhomePAGEWidget extends StatefulWidget {
  const LIAhomePAGEWidget({super.key});

  @override
  State<LIAhomePAGEWidget> createState() => _LIAhomePAGEWidgetState();
}

class _LIAhomePAGEWidgetState extends State<LIAhomePAGEWidget> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  int _carouselIndex = 0; // Índice separado para o carrossel
  late PageController _pageController;
  Timer? _timer;

  final List<String> images = [
    'assets/images/noticia1.jpg',
    'assets/images/noticia2.png',
  ];

  final List<String> titles = [
    'Projeto em BH promove inclusão e acessibilidade a pessoas surdas',
    'Setembro Azul: atividades lúdicas buscam promover conexão com cotidiano da comunidade surda',
  ];

  final List<String> descriptions = [
    'Notícia sobre inclusão em BH...',
    'Notícia sobre Setembro Azul e atividades lúdicas...',
  ];

  final List<String> links = [
    'https://www.em.com.br/saude/2024/09/6946921-projeto-em-bh-promove-inclusao-e-acessibilidade-a-pessoas-surdas.html',
    'https://www2.ifal.edu.br/campus/penedo/noticias/setembro-azul-atividades-ludicas-buscam-promover-conexao-com-cotidiano-da-comunidade-surda',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _carouselIndex);

    // Configura um Timer para mover para a próxima página a cada 20 segundos
    _timer = Timer.periodic(Duration(seconds: 20), (Timer timer) {
      if (_carouselIndex < images.length - 1) {
        _carouselIndex++;
      } else {
        _carouselIndex = 0;
      }
      _pageController.animateToPage(
        _carouselIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _openNewsLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                title: Text(
                  'Title',
                  style: TextStyle(fontFamily: 'AFACAD FLUX', fontSize: 20),
                ),
                subtitle: Text(
                  'Subtitle goes here...',
                  style: TextStyle(fontFamily: 'AFACAD FLUX', fontSize: 16),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                dense: false,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(97, 183, 101, 1),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
          title: Image.asset(
            'assets/images/lia_logo.png',
            height: 40,
          ),
          centerTitle: true,
          elevation: 0,
        ),
body: SafeArea(
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _carouselIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Text(
                              'Imagem não disponível',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titles[index],
                              style: TextStyle(
                                fontFamily: 'AFACAD FLUX',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              descriptions[index],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'AFACAD FLUX',
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () => _openNewsLink(links[index]),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(97, 183, 101, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Ver a Notícia',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: images.length,
            effect: ExpandingDotsEffect(
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: Colors.green,
              dotColor: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Parceiros:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AFACAD FLUX',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  const url = 'https://sergipetec.org.br/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/sergipetec.jfif'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Sergipetec',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AFACAD FLUX',
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  const url = 'https://www.ipaese.org.br/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/ipaese.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Ipaese',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AFACAD FLUX',
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 50, // Defina a altura conforme necessário
          alignment: Alignment.center,
          child: Text(
            '',
            style: TextStyle(
              fontFamily: 'AFACAD FLUX',
              fontSize: 24,
            ),
          ),
        ),
      ],
    ),
  ),
),
bottomNavigationBar: Container(
  height: 60,
  color: Colors.white,
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 60),
        painter: CustomNavigationBarPainter(),
      ),
      Positioned(
        top: -20,
        left: MediaQuery.of(context).size.width / 2 - 28,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(97, 183, 101, 1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IApage(),
                ),
              );
            },
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
                color: _currentIndex == 0
                    ? const Color.fromARGB(255, 175, 238, 178)
                    : const Color.fromRGBO(97, 183, 101, 1),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0; // Atualiza o índice apenas aqui
                });
                // Navegue apenas se não estiver na página atual
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LIAhomePAGEWidget(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.accessibility_new_rounded,
                size: 30,
                color: _currentIndex == 1
                    ? const Color.fromARGB(255, 175, 238, 178)
                    : const Color.fromRGBO(97, 183, 101, 1),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1; // Atualiza o índice apenas aqui
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AvatarPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ],
  ),
),

        floatingActionButton: IconButton(
          icon: Icon(
            Icons.help_outline,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Ajuda', style: TextStyle(fontFamily: 'AFACAD FLUX')),
                  content: Text('Aqui está a ajuda que você precisa.', style: TextStyle(fontFamily: 'AFACAD FLUX')),
                  actions: [
                    TextButton(
                      child: Text('Fechar', style: TextStyle(fontFamily: 'AFACAD FLUX')),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// Página de IA
class IApage extends StatelessWidget {
  const IApage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IA Page'),
        backgroundColor: const Color.fromRGBO(97, 183, 101, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LIAhomePAGEWidget()),
            );
          },
        ),
      ),
      body: Center(
        child: const Text(
          'Esta é a página de IA',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Página de Avatar
class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        backgroundColor: const Color.fromRGBO(97, 183, 101, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LIAhomePAGEWidget()),
            );
          },
        ),
      ),
      body: Center(
        child: const Text(
          'Esta é a página do Avatar',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class CustomNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, size.width, size.height),
        Radius.circular(20),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
