import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';

abstract class TbAnalise {
  Future<bool> insert(SoilAnalysis SoilAnalysis);

  Future<bool> update(SoilAnalysis SoilAnalysis);

  Future<bool> delete(SoilAnalysis SoilAnalysis);

  Future<List<SoilAnalysis>> select();

  Future<List<SoilAnalysis>> selectFilteredByData(DateTime init, DateTime end);
}
