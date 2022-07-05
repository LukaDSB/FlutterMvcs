import '../../dto/usuario_dto.dart';
import '../base_command.dart';

class ObterUsuarioCorrente extends BaseCommand {
  Future<UsuarioDto?> execute() async {
    await Future.delayed(const Duration(seconds: 1));
    return appModel.usuario;
  }
}
