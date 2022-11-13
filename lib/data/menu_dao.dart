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

  save(MenuOptions optionmenu) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(optionmenu.menuoption);
    Map<String,dynamic> optionMap = toMap(optionmenu);
    if(itemExists.isEmpty){
      print('a opção não Existia.');
      return await bancoDeDados.insert(_tablename, optionMap);
    } else {
      print('A opção já existia!');
      return await bancoDeDados.update(
        _tablename,
        optionMap,
        where: '$_name = ?',
        whereArgs: [optionmenu.menuoption],
      );
    }
  }

  Map<String,dynamic> toMap(MenuOptions optionmenu){
    print('Convertendo Opçao em Map: ');
    final Map<String,dynamic> mapaDeOpcoes = Map();
    mapaDeOpcoes[_name] = optionmenu.menuoption;
    mapaDeOpcoes[_price] = optionmenu.priceoption;
    mapaDeOpcoes[_image] = optionmenu.optionphoto;
    print('Mapa de Opções: $mapaDeOpcoes');
    return mapaDeOpcoes;
  }

  Future<List<MenuOptions>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String,dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... Encontrado: $result');
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

  Future<List<MenuOptions>> find(String NomeDaOpcao) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tablename, where: '$_name = ?', whereArgs: [NomeDaOpcao],);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String NomeDaOpcao) async {
    print('Deletando uma opção: $NomeDaOpcao');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(_tablename,  where: '$_name = ?', whereArgs: [NomeDaOpcao],);
  }

}