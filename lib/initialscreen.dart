import 'package:flutter/material.dart';
import 'package:menuproject/menuoptions.dart';

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
          [ MenuOptions('Pizza','12.00','https://static6.depositphotos.com/1160567/648/i/450/depositphotos_6482741-stock-photo-slice-of-pizza.jpg'),
            MenuOptions('Hot Dog','5.00','https://novonegocio.com.br/wp-content/uploads/2014/11/fazer-cachorro-quente.jpg'),
            MenuOptions('Sanduíche','8.00','https://conteudo.imguol.com.br/c/noticias/dd/2019/09/02/tentador-zero-beef-sanduiche-com-hamburguer-a-base-de-plantas-do-bobs-1567448386323_v2_450x600.jpg.webp'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}