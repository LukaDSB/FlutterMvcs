import 'package:flutter/material.dart';

import '../dto/usuario_dto.dart';

class AppModel extends ChangeNotifier {
  UsuarioDto? _usuarioDto;
  UsuarioDto? get usuario => _usuarioDto;
  set usuario(UsuarioDto? usuario) {
    _usuarioDto = usuario;
    notifyListeners();
  }

  // UsuarioDto? _usuarioDto2;
  // UsuarioDto? get usuario2 => _usuarioDto2;
  // set usuario2(UsuarioDto? usuario) {
  //   _usuarioDto2 = usuario;
  //   notifyListeners();
  // }

  bool _onboardingFinalizado = false;
  bool get onboardingFinalizado => _onboardingFinalizado;
  set onboardingFinalizado(bool executar) {
    _onboardingFinalizado = executar;
    notifyListeners();
  }
}
