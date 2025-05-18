import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Pantalla principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio de Pantallas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Pantalla1(),
      routes: {
        '/pantalla2': (context) => const Pantalla2(),
        '/pantalla3': (context) => const Pantalla3(),
      },
    );
  }
}

// Primera pantalla con campo de texto y dos botones
class Pantalla1 extends StatefulWidget {
  const Pantalla1({super.key});

  @override
  State<Pantalla1> createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Pantalla 1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Escribe algo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/pantalla2',
                  arguments: _controller.text,
                );
              },
              child: const Text('Ir a Pantalla 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pantalla3');
              },
              child: const Text('Ir a Pantalla 3'),
            ),
          ],
        ),
      ),
    );
  }
}

// Segunda pantalla que muestra el texto
class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    final String texto = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 2')),
      body: Center(
        child: Text(
          'Texto recibido: $texto',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Tercera pantalla que muestra una imagen
class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 3')),
      body: Center(
        child: Image.network(
          'https://cdn.memegenerator.es/imagenes/memes/full/19/30/19302944.jpg',
          width: 250,
        ),
      ),
    );
  }
}
