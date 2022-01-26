import 'package:calagem_brasil_pro/app/app_controller.dart';
import 'package:calagem_brasil_pro/app/data/packages/database/user_database/user_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../tables.dart';

class UserDatabaseV1 implements UserDataBase {
  @override
  Future<Database> dataBase() async {
    final pathDB = await getDatabasesPath();
    final path = join(pathDB, "user${AppController.to.user.uuidUsuario}.db");
    Database myDataBase = await openDatabase(path, version: 1, onCreate: (Database db, int dbCurrentVersion) async {
      print("criando a tabela");

      /// CRIA A TABELA ANÁLISE
      await db.execute(MyTables.tb_analise_solo());
      print("Tabela criada");
    });

    return myDataBase;
  }
}
