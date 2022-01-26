import 'package:calagem_brasil_pro/app/modules/synchronization/sync_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SyncView extends StatelessWidget {
  const SyncView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SyncController>(
        init: SyncController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(height: Get.width * 0.025),
                    Text(
                      "Sincronizando dados",
                      style: TextStyle(fontSize: 20),
                    ),
                    for (int i = 0; i < _.listSync.length; i++) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_.listSync[i].title),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            if (_.listSync[i].status == StatusSync.start) ...[
                              CircularProgressIndicator(),
                            ] else if (_.listSync[i].status == StatusSync.failed) ...[
                              Icon(Icons.error, color: Colors.red),
                            ] else ...[
                              Icon(Icons.check_circle, color: Colors.green),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        });
  }
}
