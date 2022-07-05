import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvcs_template/models/app_model.dart';

class PerfilView extends StatelessWidget {
  PerfilView({Key? key}) : super(key: key);
  var usuario = GetIt.I.get<AppModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/aniversario'),
                icon: const Icon(Icons.abc))
          ],
          title: const Text("Perfil"),
        ),
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: usuario,
              builder: (BuildContext context, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Nome: ',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(usuario.usuario!.nome!),
                  ],
                );
              },
            ),
            // Text('Apelido: ' + usuario.data!.apelido!)
          ],
        ))));
  }
}
