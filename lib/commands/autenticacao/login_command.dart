import '../../dto/usuario_dto.dart';
import '../base_command.dart';

class LoginCommand extends BaseCommand {
  Future<void> execute() async {
    await Future.delayed(const Duration(seconds: 1));
    appModel.usuario = UsuarioDto()
      ..nome = "Lucas de S. Benevenute"
      ..apelido = "LukaDSB"
      ..teste = "Teste kk"
      ..senha = 123;
  }
}
