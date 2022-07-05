import 'package:mvcs_template/commands/base_command.dart';
import 'package:mvcs_template/dto/usuario_dto.dart';

class RecebeCommand extends BaseCommand {
  Future<void> execute(String novoNome) async {
    await Future.delayed(const Duration(seconds: 1));
    appModel.usuario = UsuarioDto()..nome = novoNome;
  }
}
