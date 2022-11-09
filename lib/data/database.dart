import 'package:menuproject/data/menu_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future <Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'menu.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(MenuDao.tableSql);
  }, version: 1,);
}


