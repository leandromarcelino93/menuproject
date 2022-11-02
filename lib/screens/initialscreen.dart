import 'package:flutter/material.dart';
import 'package:menuproject/data/menu_inherited.dart';
import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: ListView(
        ///Children com as opções do cardápio
        children: MenuInherited.of(context).menuList,
        padding: EdgeInsets.only(top: 8, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        menuContext: context,
                      )));
          /*É desta forma que estamos passando as informações da tela inicial para a tela de formulário:
   O parâmetro menuContext na classe do formulário recebe o argumento context que estamos enviando por aqui.
   */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
