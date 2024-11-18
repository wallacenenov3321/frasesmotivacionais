import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> _frases = [];
  final TextEditingController _fraseController = TextEditingController();

  void _addfrase(){
    if(_fraseController.text.isNotEmpty) {
      setState(() {
        _frases.add(_fraseController.text);
        _fraseController.clear();
      });
    }
  }

  String _sortearFrase(){
    if (_frases.isEmpty) {
      return "Adicione frases para começar!";
    }
    final random = Random();
    return _frases[random.nextInt(_frases.length)];
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text("Dicas motivacionais",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            TextFormField(
              controller: _fraseController,
              decoration: const InputDecoration(
                  labelText: 'Qual a dica motivacional de hoje?',
                  border: OutlineInputBorder(),
                  ),
              onFieldSubmitted: (String value){
                print(value);
              },
            ),
            SizedBox(width: 30, height: 30),
            ElevatedButton(
                onPressed: _addfrase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Adicionar uma frase')
            ),

            SizedBox(width: 30, height: 30),
            ElevatedButton(
                onPressed: () {
                  final frasealeatoria = _sortearFrase();
                  showDialog(
                    context: context,
                    builder:(BuildContext context) {
                      return AlertDialog(
                        title:  Text('Frase Sorteada'),
                        content: Text(frasealeatoria),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Fechar'),
                          ),
                        ],
                      );
                    } ,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Sortear uma frase')
            ),

          ],
        ),
      ),
    );
  }
}