import 'package:flutter/material.dart';

import '../commands/usuario/obter_usuario_corrente.dart';
import '../dto/usuario_dto.dart';

class TelaFinalView extends StatelessWidget {
  const TelaFinalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Tela final"),
      ),
      body: SafeArea(
          child: Center(
        child: FutureBuilder<UsuarioDto?>(
          future: ObterUsuarioCorrente().execute(),
          builder: (context, usuario) {
            if (usuario.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nome: ',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(usuario.data!.nome!),
                    ],
                  )
                ],
              );
            }
          },
        ),
      )),
    );
  }
}
