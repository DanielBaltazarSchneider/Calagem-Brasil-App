class MyTables {
  static String analises = "tb_analise_solo";

  static String tb_analise_solo() =>
      "CREATE TABLE $analises (" +
      "id_analise INTEGER PRIMARY KEY AUTOINCREMENT," +
      "UUID VARCHAR KEY UNIQUE NOT NULL," +
      "uuid_usuario VARCHAR NOT NULL," +
      "cliente VARCHAR NOT NULL," +
      "data_upload DATETIME NOT NULL," +
      "data_edicao DATETIME NOT NULL," +
      "local VARCHAR NOT NULL," +
      "area REAL NOT NULL," +
      "pH REAL NOT NULL," +
      "HAl REAL NOT NULL," +
      "Al REAL NOT NULL," +
      "Ca REAL NOT NULL," +
      "Mg REAL NOT NULL," +
      "K REAL NOT NULL," +
      "Na REAL NOT NULL," +
      "isUpload BOOLEAN," +
      "isEditing BOOLEAN," +
      "isDeleted BOOLEAN " +
      ")";
}
