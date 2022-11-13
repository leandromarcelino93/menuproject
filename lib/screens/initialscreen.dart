import 'package:flutter/material.dart';
import 'package:menuproject/components/menuoptions.dart';
import 'package:menuproject/data/menu_dao.dart';
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
        actions: [IconButton(onPressed: (){setState(() {});}, icon: Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<MenuOptions>>(future: MenuDao().findAll(), builder: (context, snapshot){
          List<MenuOptions>? items = snapshot.data;
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
              break;
                case ConnectionState.waiting:
                  return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
                  break;
                case ConnectionState.active:
                  return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final MenuOptions option = items[index];
                            return option;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 128),
                          Text('Não há nenhuma opção',
                              style: TextStyle(fontSize: 32))
                        ],
                      ),
                    );
                  }
                  return Text('Erro ao carregar as Opções');
                  break;
              }
              return Text('Erro desconhecido');
        }),
      ),
      /*ListView(
        ///Children com as opções do cardápio
        children: MenuInherited.of(context).menuList,
        padding: EdgeInsets.only(top: 8, bottom: 70),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                    menuContext: context,
                  ))).then((value) => setState((){print('Estamos rebuildando a tela!');}));
          /*É desta forma que estamos passando as informações da tela inicial para a tela de formulário:
   O parâmetro menuContext na classe do formulário recebe o argumento context que estamos enviando por aqui.
   */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
