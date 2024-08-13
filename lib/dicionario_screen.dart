import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'liahome_page_widget.dart'; 

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initSpeech();
  }

  void _initSpeech() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() {});
    }
  }

  void _startListening() async {
    if (_isListening) {
      await _speech.stop();
      setState(() {
        _isListening = false;
      });
    } else {
      await _speech.listen(
        onResult: (result) {
          setState(() {
            _textController.text = result.recognizedWords;
          });
        },
      );
      setState(() {
        _isListening = true;
      });
    }
  }

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
                tileColor: const Color.fromARGB(255, 0, 0, 0),
                dense: false,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF50723C),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0), size: 30),
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
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isListening ? Icons.stop : Icons.mic,
                        color: Colors.grey,
                      ),
                      onPressed: _startListening,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
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
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LIAhomePAGEWidget()),
                              (route) => false,
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.book_outlined, color: Color(0xFF50723C), size: 30),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BookScreen()),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt_sharp, color: Color(0xFF50723C), size: 30),
                          onPressed: () {
            
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.back_hand_outlined, color: Color(0xFF50723C), size: 30),
                          onPressed: () {
                            
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
