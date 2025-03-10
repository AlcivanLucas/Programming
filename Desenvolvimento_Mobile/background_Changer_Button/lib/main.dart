import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mudar Cores',
      home: const ColorChanger(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color backgroundColor = Colors.white;

  String getColorName(Color color) {
    if (color == Colors.red) return 'Vermelho';
    if (color == Colors.black) return 'Preto';
    if (color == Colors.blue) return 'Azul';
    return 'Branco';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mudar Cor de Fundo'),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cor atual: ${getColorName(backgroundColor)}',
                style: TextStyle(
                  fontSize: 24,
                  color: backgroundColor == Colors.black 
                      ? Colors.white 
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => setState(() => backgroundColor = Colors.red),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Vermelho',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => setState(() => backgroundColor = Colors.black),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Preto',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => setState(() => backgroundColor = Colors.blue),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Azul',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}