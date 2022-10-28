import 'package:flutter/material.dart';
import 'package:menuproject/data/menu_inherited.dart';
import 'package:menuproject/menuoptions.dart';
import 'form_screen.dart';

class InitialScreen extends StatelessWidget {

  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: ListView(
        ///Children com as opções do cardápio
        children:
           MenuInherited.of(context).menuList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push
            (context,
              MaterialPageRoute(builder: (contextNew) => FormScreen(menuContext: context,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}