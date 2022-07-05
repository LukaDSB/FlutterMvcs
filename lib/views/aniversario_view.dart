import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvcs_template/commands/teste/recebe_command.dart';
import 'package:mvcs_template/commands/teste/teste_command.dart';
import 'package:mvcs_template/models/app_model.dart';

class AniversarioView extends StatefulWidget {
  const AniversarioView({Key? key}) : super(key: key);

  @override
  State<AniversarioView> createState() => _AniversarioViewState();
}

class _AniversarioViewState extends State<AniversarioView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF2F2F2),
          appBar: AppBar(
              title: const Text('Anivesariantes'),
              backgroundColor: const Color(0xff009950),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/final');
                  },
                  child: const Icon(Icons.add_business_outlined),
                )
              ],
              leading: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/perfil'),
                  icon: const Icon(Icons.arrow_back_outlined))),
          body: Column(
            children: const [
              NavBarBottomContainer(),
              DescriptionText(),
              CalendarioContainer(),
              SearchContainer(),
              ListContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 30, left: 30, top: 14, bottom: 10),
      child: Text(
        'Veja os cooperados que comemoram aniversário. Selecione uma data ou pesquise pelo nome.',
        style: TextStyle(fontSize: 13.5, color: Color.fromARGB(92, 0, 0, 0)),
      ),
    );
  }
}

class ListContainer extends StatefulWidget {
  const ListContainer({Key? key}) : super(key: key);

  @override
  State<ListContainer> createState() => _ListContainer();
}

class _ListContainer extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    var variavelkk = GetIt.I.get<AppModel>();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          height: 300,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFFFFFF)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    const Text(
                      'ANIVERSARIANTES DO DIA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: const [
                        Text(
                          '30',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          'OUT',
                          style: TextStyle(
                              color: Color(0XFF009950), fontFamily: 'Roboto'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 220,
                child: AnimatedBuilder(
                  animation: variavelkk,
                  builder: (BuildContext context, Widget? child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(1),
                      itemCount: 50,
                      itemBuilder: (BuildContext context, int index) {
                        return ListViewNomes(
                            nome: variavelkk.usuario?.nome ?? 'sla');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class ListViewNomes extends StatelessWidget {
  const ListViewNomes({
    Key? key,
    required this.nome,
  }) : super(key: key);
  final String nome;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: SizedBox(
          width: 330,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(nome),
              ),
            ],
          ),
        ));
  }
}

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  // var usuario = GetIt.I.get<AppModel>();
  final minhaController = TextEditingController();
  @override
  void dispose() {
    minhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFFFFFF)),
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: minhaController,
                  builder: (BuildContext context, Widget? child) {
                    return TextField(
                      controller: minhaController,
                      decoration: const InputDecoration(
                        hintText: 'Nome do aniversariante',
                        hintStyle: TextStyle(
                          color: (Color.fromARGB(92, 0, 0, 0)),
                        ),
                      ),
                      onChanged: (String value) {
                        RecebeCommand().execute(minhaController.text);
                      },
                      // onEditingComplete: () => showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         content: Text(minhaController.text),
                      //       );
                      //     }),
                    );
                  },
                ),
              ],
            )));
  }
}

class CalendarioContainer extends StatefulWidget {
  const CalendarioContainer({Key? key}) : super(key: key);

  @override
  State<CalendarioContainer> createState() => _CalendarioContainer();
}

class _CalendarioContainer extends State<CalendarioContainer> {
  final bool _novo = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFFFFFFF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month_sharp),
                    // Icons.calendar_month_sharp,
                    color: const Color(0xFF009950),
                    // size: 35,
                    onPressed: () async {
                      setState(() {});
                      await TesteCommand().execute();
                    },
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'OUTUBRO - 2017',
                  style: TextStyle(fontSize: 16, color: Color(0xFF009950)),
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.play_arrow_sharp,
                  color: Color(0xFF009950),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NavBarBottomContainer extends StatefulWidget {
  const NavBarBottomContainer({Key? key}) : super(key: key);

  @override
  State<NavBarBottomContainer> createState() => _NavBarBottomContainerState();
}

class _NavBarBottomContainerState extends State<NavBarBottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(bottom: 5),
      color: const Color(0XFF005B3E),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'ANIVERSÁRIOS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'UNIMED',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
