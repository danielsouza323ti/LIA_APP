import 'package:flutter/material.dart';

class LIAhomePAGEWidget extends StatefulWidget {
  const LIAhomePAGEWidget({super.key});

  @override
  State<LIAhomePAGEWidget> createState() => _LIAhomePAGEWidgetState();
}

class _LIAhomePAGEWidgetState extends State<LIAhomePAGEWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<String> images = [
    'assets/images/ipaese.jpeg', // Substitua pelos caminhos das suas imagens
    'assets/images/ipaese2.jpeg',
    'assets/images/ipaese1.jpeg',
  ];

  final List<String> captions = [
    'Legenda 1', // Adicione suas legendas aqui
    'Legenda 2',
    'Legenda 3',
  ];

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
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                dense: false,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF50723C),
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
            children: [
              // Carrossel de imagens com bordas arredondadas e sombra
              Container(
                height: 200, // Altura do carrossel
                child: PageView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.bottomCenter, // Alinha a legenda na parte inferior
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
                          child: Container(
                            height: 200, // Mantém a altura padrão das imagens
                            width: MediaQuery.of(context).size.width, // Largura da tela
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0, 5), // Sombra para baixo
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
                          padding: EdgeInsets.all(8), // Espaçamento da legenda
                          color: Colors.lightGreenAccent, // Fundo verde claro
                          child: Text(
                            captions[index],
                            style: TextStyle(
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
              SizedBox(height: 20), // Espaço entre o carrossel e o restante do conteúdo
              Expanded(
                child: Center(
                  child: Text(
                    'Bem-vindo à LIA!',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60, // Diminuindo a altura da barra de navegação
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 60),
                painter: CustomNavigationBarPainter(),
              ),
              Center(
                heightFactor: 0.8, // Ajustando a posição do botão de câmera
                child: Container(
                  width: 48, // Diminuindo o tamanho do botão
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF50723C),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 28, // Aumentando o ícone da câmera
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IApage(), // Substitua pela sua tela
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Ícone de Home
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                        color: _currentIndex == 0
                            ? Colors.lightGreen // Destacar a cor se for a tela Home
                            : const Color(0xFF50723C),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LIAhomePAGEWidget(),
                            ),
                          );
                        });
                      },
                    ),
                    SizedBox(width: 80), // Espaço para o botão central
                    // Ícone de Avatar
                    IconButton(
                      icon: Icon(
                        Icons.back_hand,
                        size: 30,
                        color: _currentIndex == 1
                            ? Colors.lightGreen // Destacar a cor se for a tela Avatar
                            : const Color(0xFF50723C),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                          // Ação ao navegar para a tela do Avatar
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AvatarPage(), // Substitua pela sua tela
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Ação ao pressionar o botão de ajuda
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Ajuda'),
                  content: Text('Aqui está a ajuda que você precisa.'),
                  actions: [
                    TextButton(
                      child: Text('Fechar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: const Color(0xFF50723C),
          child: Icon(Icons.help_outline),
        ),
      ),
    );
  }
}

class CustomNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 218, 218, 218)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double centerX = size.width / 2;

    path.moveTo(0, 20);
    path.quadraticBezierTo(5, 0, 40, 0);
    path.lineTo(centerX - 30, 0);
    path.quadraticBezierTo(centerX - 30, 40, centerX, 40);
    path.quadraticBezierTo(centerX + 30, 40, centerX + 30, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width - 5, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, const Color(0xFF50723C), 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Defina sua classe IApage aqui
class IApage extends StatelessWidget {
  const IApage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IA Page'),
        backgroundColor: const Color(0xFF50723C),
      ),
      body: Center(
        child: Text(
          'Esta é a página de IA',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Defina sua classe AvatarPage aqui
class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        backgroundColor: const Color(0xFF50723C),
      ),
      body: Center(
        child: Text(
          'Esta é a página do Avatar',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
