import 'dart:async';

import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/packages/database/tb_analises/tb_analise_v1.dart';
import 'package:calagem_brasil_pro/app/data/repository/analysis_repository/analise_repository.dart';
import 'package:calagem_brasil_pro/app/modules/home/home_view.dart';
import 'package:get/get.dart';

class SyncController extends GetxController {
  TbAnaliseV1 tbAnalise = TbAnaliseV1();

  List<SyncObject> listSync = [];

  /*
      Sincronização das analises
   */

  Future<List<SoilAnalysis>> getLastUploadAnalise() async {
    return await tbAnalise.selectLastUpload();
  }

  Future<void> synchronization() async {
    await uploadAnalyses();
    await getOnlineAnalises();
    await Future.delayed(Duration(seconds: 1));
    Get.offAll(() => HomeView());
  }

  getOnlineAnalises() async {
    SyncObject syncObject = SyncObject(
      id: listSync.length,
      status: StatusSync.start,
      title: "Download de análises",
      subtitle: "",
      percent: 0,
    );
    listSync.add(syncObject);
    update();
    try {
      List<SoilAnalysis> lastAnalise = await getLastUploadAnalise();
      String uuidLastAnalyses = "0";
      if (lastAnalise.length > 0) {
        uuidLastAnalyses = lastAnalise[0].uuid;
      }

      List<SoilAnalysis> analises = await AnalysesRepository.getOnlineAnalyses(uuidLastAnalyses);
      print("Novas análise: ${analises.length}");
      for (SoilAnalysis soilAnalysis in analises) {
        soilAnalysis.isUpload = true;
        tbAnalise.insert(soilAnalysis);
      }
      // atualiza a lista com o status sucesso
      syncObject.status = StatusSync.end;
      listSync[listSync.length - 1] = syncObject;
      update();
    } catch (e) {
      // atualiza a lista com o status de erro
      syncObject.status = StatusSync.failed;
      syncObject.subtitle = "$e";
      listSync[listSync.length - 1] = syncObject;
      update();
    }
  }

  Future<void> uploadAnalyses() async {
    SyncObject syncObject = SyncObject(
      id: listSync.length,
      status: StatusSync.start,
      title: "Upload de análises",
      subtitle: "",
      percent: 0,
    );
    listSync.add(syncObject);
    try {
      List<SoilAnalysis> analises = await AnalysesRepository.uploadAnalises(await tbAnalise.selectNotUpload());
      for (SoilAnalysis analise in analises) {
        analise.isUpload = true;
        tbAnalise.updateIsSync(analise);
      }
      syncObject.status = StatusSync.end;
      syncObject.subtitle = "Success";
      listSync[listSync.length - 1] = syncObject;
      update();
    } catch (e) {
      syncObject.status = StatusSync.failed;
      syncObject.subtitle = "$e";
      listSync[listSync.length - 1] = syncObject;
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    synchronization();
  }
}

class SyncObject {
  SyncObject({
    required this.id,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.percent,
  });

  int id;
  StatusSync status;
  String title;
  String subtitle;
  double percent;
}

enum StatusSync { start, inProgress, end, failed }
