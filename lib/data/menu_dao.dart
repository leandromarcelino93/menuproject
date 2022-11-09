import 'package:menuproject/components/menuoptions.dart';
import 'package:menuproject/data/database.dart';
import 'package:sqflite/sqlite_api.dart';

class MenuDao {

  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_price TEXT, '
      '$_image TEXT)';

  static String _tablename = 'MenuTable';
  static String _name = 'name';
  static String _price = 'price';
  static String _image = 'image';

  save(MenuOptions optionmenu) async {}

  Future<List<MenuOptions>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String,dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dads no banco de dados... Encontrado: $result');
    return toList(result);
  }
  List<MenuOptions> toList(List<Map<String,dynamic>> mapaDeOpcoes){
  print('Convertendo to List: ');
  final List<MenuOptions> opcoes = [];
  for (Map<String,dynamic> linha in mapaDeOpcoes){
      final MenuOptions opcao = MenuOptions(linha[_name], linha[_price], linha[_image]);
      opcoes.add(opcao);
    }
  print('Lista de Opções $opcoes');
  return opcoes;
  }


  // Future<List<MenuOptions>> find(String NomeDaOpcao) async {}

  delete(String NomeDaOpcao) async {}

}