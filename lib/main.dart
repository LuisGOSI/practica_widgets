import 'dart:async'; // Con esto se puede usar el cronómetro
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronómetro',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variables para el cronómetro
  bool isRunning = false;
  int seconds = 0;
  late Timer timer; 

  // Función para iniciar o detener el cronómetro
  void toggleTimer() {
    setState(() {
      isRunning = !isRunning;

      if (isRunning) {
        startTimer();
      } else {
        stopTimer();
      }
    });
  }

  // Función para iniciar el cronómetro
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  // Función para detener el cronómetro
  void stopTimer() {
    // Cancelar el temporizador
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cronómetro'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Contenedor para mostrar el tiempo transcurrido
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Tiempo: $seconds segundos',
              style:  const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),

          // Widget normal: Botón para iniciar o detener el cronómetro
          TextButton(
            onPressed: toggleTimer,
            child: isRunning ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
          ),

          // Widget de diseño: Fila con iconos de reinicio y ajustes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    // Reiniciar el cronómetro
                    seconds = 0;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
