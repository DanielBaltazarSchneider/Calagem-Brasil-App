import 'package:calagem_brasil_pro/app/data/packages/secure_storage/secure_storage.dart';

class SecureStorageRepository {
  // save
  static Future<void> saveEmailUser(String email) async {
    await AppSecureStorage.write("email", email);
  }

  static Future<void> savePasswordUser(String password) async {
    await AppSecureStorage.write("password", password);
  }

  static Future<void> saveDomainUser(String domain) async {
    await AppSecureStorage.write("domain", domain);
  }

  // read
  static Future<String> readEmailUser() async {
    return await AppSecureStorage.read("email");
  }

  static Future<String> readPasswordUser() async {
    return await AppSecureStorage.read("password");
  }

  static Future<String> readDomainUser() async {
    return await AppSecureStorage.read("domain");
  }

  //delete
  static Future<void> deleteEmailUser() async {
    return await AppSecureStorage.delete("email");
  }

  static Future<void> deletePasswordUser() async {
    return await AppSecureStorage.delete("password");
  }

  static Future<void> deleteDomainUser() async {
    return await AppSecureStorage.delete("domain");
  }
}
