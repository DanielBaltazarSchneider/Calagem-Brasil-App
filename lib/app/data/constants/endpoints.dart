class Endpoint {
  static String _endpoint = "http://192.168.0.105/api_calagem/v1"; // LOCAL HOST WINDOWS
  // static String _endpoint = "https://calagembrasil.com.br/api/v1";

  static String get validateAuth => "$_endpoint/auth/validate-login"; // Validação de login
  static String get getAnalysisUser => "$_endpoint/analise/select-all-analises"; // Retorna as análises de solo do usuário
  static String get uploadAnalysis => "$_endpoint/analise/insert-analises"; // Envia as análises de solo do usuário

}
