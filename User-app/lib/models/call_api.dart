// ignore: camel_case_types
class Call_API {
  String status;
  String appid;
  String token;
  String channel;

  Call_API({this.status, this.appid, this.token, this.channel});

  Call_API.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    appid = json['appid'];
    token = json['token'];
    channel = json['channel'];
  }


}

