import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';

import 'dart:async';

class LIAhomePAGEWidget extends StatefulWidget {
  const LIAhomePAGEWidget({super.key});

  @override
  State<LIAhomePAGEWidget> createState() => _LIAhomePAGEWidgetState();
}

class _LIAhomePAGEWidgetState extends State<LIAhomePAGEWidget> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  late PageController _pageController;
  Timer? _timer;

  final List<String> images = [
    'assets/images/ipaese.jpeg', // Substitua pelos caminhos das suas imagens
    'assets/images/ipaese1.jpeg',
  ];

  final List<String> captions = [
    '', // Adicione suas legendas aqui
    '',
  ];

  @override
void initState() {
  super.initState();
  _pageController = PageController(initialPage: _currentIndex);
}

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
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
            'assets/images/lia_logo.png', // Substitua pelo caminho correto da sua imagem
            height: 40, // Ajuste a altura conforme necessário
          ),
          centerTitle: true,
          elevation: 0,
        ),
 body: SafeArea(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 200, // Altura do carrossel
        child: FocusScope(
          canRequestFocus: false, // Impede que o PageView mude o foco
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: const Color.fromRGBO(97, 183, 101, 1),
                    child: Text(
                      captions[index],
                      style: TextStyle(
                        fontFamily: 'AFACAD FLUX',
                        color: Colors.black,
                        fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
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
                    SizedBox(height: 10), // Espaço entre o título e as caixas
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
                        width: MediaQuery.of(context).size.width, // Largura da tela
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(8), // Espaçamento interno
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9), // Cor de fundo com maior opacidade
                          borderRadius: BorderRadius.circular(12), // Bordas arredondadas
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
                              radius: 20, // Tamanho da logo em círculo
                              backgroundImage: AssetImage('assets/images/sergipetec.jfif'), // Caminho da logo
                            ),
                            SizedBox(width: 10), // Espaço entre a logo e o texto
                            Text(
                              'Sergipetec', // Nome do parceiro
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
                        width: MediaQuery.of(context).size.width, // Largura da tela
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(8), // Espaçamento interno
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9), // Cor de fundo com maior opacidade
                          borderRadius: BorderRadius.circular(12), // Bordas arredondadas
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
                              radius: 20, // Tamanho da logo em círculo
                              backgroundImage: AssetImage('assets/images/ipaese.png'), // Caminho da logo
                            ),
                            SizedBox(width: 10), // Espaço entre a logo e o texto
                            Text(
                              'Ipaese', // Nome do parceiro
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
              Expanded(
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(
                      fontFamily: 'AFACAD FLUX',
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
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
