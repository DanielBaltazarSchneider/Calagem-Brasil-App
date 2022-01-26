import 'package:sqflite/sqflite.dart';

abstract class UserDataBase {
  Future<Database> dataBase();
}
