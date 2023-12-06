import 'package:flutter/material.dart';
import 'package:landing_page_test/custom_style.dart';
import 'package:landing_page_test/lorem_ipsum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller = ScrollController();
  bool isActiveResumo = false;
  bool isActiveProfissional = false;
  bool isActiveHobbies = false;
  bool isActiveContatos = false;
  List listActive = [];

  @override
  void initState() {
    super.initState();
    listActive = [isActiveResumo, isActiveProfissional, isActiveHobbies, isActiveContatos];
  }

  handleActive(String value) {
    // ignore: unused_local_variable
    listActive = listActive.map((e) => e = false).toList();
    if (value == "Resumo") listActive[0] = true;
    if (value == "Profissional") listActive[1] = true;
    if (value == "Hobbies") listActive[2] = true;
    if (value == "Contatos") listActive[3] = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 200,
        backgroundColor: Colors.cyan.shade100,
        title: const Text("André Guimarães"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: listActive[0] ? Colors.lightBlue.shade300 : null,
            ),
            onPressed: () {
              handleActive("Resumo");
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate,
              );
            },
            child: const Text("Resumo"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: listActive[1] ? Colors.blueGrey.shade200 : null,
            ),
            onPressed: () {
              handleActive("Profissional");
              controller.animateTo(
                480,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate,
              );
            },
            child: const Text("Profissional"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: listActive[2] ? Colors.greenAccent.shade200 : null,
            ),
            onPressed: () {
              handleActive("Hobbies");
              controller.animateTo(
                1100,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate,
              );
            },
            child: const Text("Hobbies"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: listActive[3] ? Colors.black87 : null,
              foregroundColor: listActive[3] ? Colors.white : null,
            ),
            onPressed: () {
              handleActive("Contatos");
              controller.animateTo(
                2000,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate,
              );
            },
            child: const Text("Contatos"),
          ),
          SizedBox.fromSize(
            size: const Size(200, 10),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 300),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 600),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        color: Colors.lightBlue.shade100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Resumo sobre mim...",
                              style: customStyleHead,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "$texto1 $texto1",
                              style: customStyleContent,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                    Padding(
                      padding: const EdgeInsets.only(left: 600),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        color: Colors.blueGrey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Carreira",
                              style: customStyleHead,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "$texto1 $texto1",
                              style: customStyleContent,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                    Padding(
                      padding: const EdgeInsets.only(right: 600),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        color: Colors.greenAccent.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hobbies",
                              style: customStyleHead,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "$texto1 $texto1",
                              style: customStyleContent,
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        color: Colors.deepPurple.shade300,
                        child: Column(
                          children: [
                            Text(
                              "O Futuro",
                              style: customStyleHead,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "$texto1 $texto1",
                              style: customStyleContent.copyWith(color: Colors.white, fontWeight: FontWeight.w200),
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(32),
                color: Colors.black87,
                height: 200,
                width: double.infinity,
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Meu rodapé, contatos e etc...",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
