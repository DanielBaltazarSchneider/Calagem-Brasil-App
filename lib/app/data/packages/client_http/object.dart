import 'dart:convert';

ObjectApi objectApiFromMap(Map<String, dynamic> mapObject) => ObjectApi.fromMap(mapObject);

String objectApiToMap(ObjectApi data) => json.encode(data.toMap());

class ObjectApi {
  ObjectApi({
    required this.status,
    required this.content,
  });

  bool status;
  Content content;

  factory ObjectApi.fromMap(Map<String, dynamic> json) => ObjectApi(
        status: json["status"],
        content: Content.fromMap(json["content"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "content": content.toMap(),
      };
}

class Content {
  Content({
    required this.status,
    required this.data,
  });

  bool status;
  dynamic data;

  factory Content.fromMap(Map<String, dynamic> json) => Content(status: json["status"], data: json["data"]);

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
