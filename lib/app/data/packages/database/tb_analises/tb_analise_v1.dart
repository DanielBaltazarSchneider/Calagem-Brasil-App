import 'dart:convert';

import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/packages/database/user_database/user_database_v1.dart';
import 'package:sqflite/sqflite.dart';

import '../tables.dart';
import 'tb_analise.dart';

class TbAnaliseV1 extends TbAnalise {
  @override
  Future<List<SoilAnalysis>> select() async {
    Database db = await UserDatabaseV1().dataBase();
    List map = await db.rawQuery("SELECT * FROM 'tb_analise_solo' WHERE isDeleted=0");
    //print("SELECT ANALISES:\n" + jsonEncode(map));

    return soilAnalysisFromJson(jsonEncode(map));
  }

  @override
  Future<List<SoilAnalysis>> selectFilteredByData(DateTime init, DateTime end) async {
    Database db = await UserDatabaseV1().dataBase();
    List map = await db.rawQuery("SELECT * FROM 'tb_analise_solo' WHERE isDeleted=0 AND data_upload BETWEEN '$init' AND '$end'");
    print("SELECT FILTERED ANALISES:\n" + jsonEncode(map));
    return soilAnalysisFromJson(jsonEncode(map));
  }

  Future<List<SoilAnalysis>> selectLastUpload() async {
    Database db = await UserDatabaseV1().dataBase();
    List map = await db.rawQuery("SELECT * FROM 'tb_analise_solo' WHERE isDeleted=0 AND isUpload=1 ORDER BY id_analise DESC LIMIT 1");
    print("Last ANALISES:\n" + jsonEncode(map));
    return soilAnalysisFromJson(jsonEncode(map));
  }

  Future<List<SoilAnalysis>> selectNotUpload() async {
    Database db = await UserDatabaseV1().dataBase();
    List map = await db.rawQuery("SELECT * FROM 'tb_analise_solo' WHERE isDeleted=0 AND isUpload=0");
    print("ANALISES aguardando o upload:\n" + jsonEncode(map));
    return soilAnalysisFromJson(jsonEncode(map));
  }

  @override
  Future<bool> delete(SoilAnalysis soilAnalysis) async {
    Database db = await UserDatabaseV1().dataBase();
    int count = await db.rawUpdate("UPDATE tb_analise_solo SET isDeleted=1 WHERE UUID='${soilAnalysis.uuid}'");
    if (count > 0) {
      print("Deletado com SUCESSO");
      return true;
    } else {
      print("ERRO ao deletar");
      return false;
    }
  }

  @override
  Future<bool> insert(SoilAnalysis analysis) async {
    try {
      Database db = await UserDatabaseV1().dataBase();
      String bodyTable =
          "INSERT INTO tb_analise_solo (UUID, uuid_usuario, cliente, data_upload, data_edicao, local, area, pH, HAl, Al, Ca, Mg, K, Na, isUpload, isEditing, isDeleted) VALUES";
      String valuesTable = "(" +
          "'${analysis.uuid}', " +
          "'${analysis.uuidUsuario}', " +
          "'${analysis.cliente}', " +
          "'${analysis.dataUpload}', " +
          "'${analysis.dataEdicao}', " +
          "'${analysis.local}', " +
          "${analysis.area}, " +
          "${analysis.pH}, " +
          "${analysis.hAl}, " +
          "${analysis.al}, " +
          "${analysis.ca}, " +
          "${analysis.mg}, " +
          "${analysis.k}, " +
          "${analysis.na}," +
          "${analysis.isUpload ? 1 : 0}," +
          "0," +
          "0" +
          ")";

      int id1 = await db.rawInsert(bodyTable + valuesTable);
      print(id1);
      if (id1 > 0) {
        print("Salvo com SUCESSO");
        return true;
      } else {
        print("Ocorreu um erro ao salvar");
        return false;
      }
    } catch (e) {
      print("ERRO AO SALVAR A ANÁLISE => $e");
      return false;
    }
  }

  @override
  Future<bool> update(SoilAnalysis soilAnalysis) async {
    Database db = await UserDatabaseV1().dataBase();
    int count = await db.rawUpdate("UPDATE tb_analise_solo SET " +
        "data_edicao='${DateTime.now()}', " +
        "local='${soilAnalysis.local}', " +
        "area=${soilAnalysis.area}, " +
        "pH=${soilAnalysis.pH}, " +
        "HAl=${soilAnalysis.hAl}, " +
        "Al=${soilAnalysis.al}, " +
        "Ca=${soilAnalysis.ca}, " +
        "Mg=${soilAnalysis.mg}, " +
        "K=${soilAnalysis.k}, " +
        "Na=${soilAnalysis.na} ," +
        "isUpload=${soilAnalysis.isUpload ? 1 : 0}, " +
        "isEditing=1, " +
        "isDeleted=0 " +
        "WHERE UUID='${soilAnalysis.uuid}'");
    if (count > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateIsSync(SoilAnalysis soilAnalysis) async {
    Database db = await UserDatabaseV1().dataBase();
    int count = await db.rawUpdate("UPDATE tb_analise_solo SET " + "isUpload=1 " + "WHERE UUID='${soilAnalysis.uuid}'");
    if (count > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteAll() async {
    Database db = await UserDatabaseV1().dataBase();
    db.delete(MyTables.analises);
    return true;
  }
}
