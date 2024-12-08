import 'package:flutter/material.dart';
import 'pantallas/pantalla_login.dart';
import 'pantallas/pantalla_bienvenida.dart';
import 'pantallas/pantalla_categorias.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Zapatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Oculta la cinta de depuración
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaLogin(),
        '/bienvenida': (context) => PantallaBienvenida(),
        '/categorias': (context) => PantallaCategorias(),
      },
    );
  }
}
