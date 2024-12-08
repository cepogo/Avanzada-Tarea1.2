// pantalla_login.dart
import 'package:flutter/material.dart';
import '../logica/logica_login.dart';

class PantallaLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final LogicaLogin _logicaLogin = LogicaLogin();
  String mensajeError = '';

  void iniciarSesion() {
    final String usuario = _usuarioController.text;
    final String contrasena = _contrasenaController.text;
    if (_logicaLogin.validarCredenciales(usuario, contrasena)) {
      Navigator.pushReplacementNamed(context, '/bienvenida');
    } else {
      setState(() {
        mensajeError = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
        backgroundColor: Colors.brown[500],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown.shade200, Colors.brown.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.brown[600],
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.brown),
                    hintText: 'Usuario',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _contrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.brown),
                    hintText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: iniciarSesion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[100],
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  ),
                  child: Text('Iniciar Sesión', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 20),
                Text(
                  mensajeError,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
