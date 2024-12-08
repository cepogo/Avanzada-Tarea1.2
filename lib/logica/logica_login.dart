// logica_login.dart
class LogicaLogin {
  bool validarCredenciales(String usuario, String contrasena) {
    const usuarioValido = 'admin';
    const contrasenaValida = '123';
    return usuario == usuarioValido && contrasena == contrasenaValida;
  }
}