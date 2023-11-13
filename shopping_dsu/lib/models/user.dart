class User {
  // 새로 가입하는 유저의 정보가 db로 전송되기 위하여 포맷을 변경
  int user_id;
  String user_regID;
  String user_email;
  String user_password;
  String user_name;
  String user_phone;

  User(this.user_id, this.user_regID, this.user_email, this.user_password,
      this.user_name, this.user_phone);

  // 로그인 성공한 유저의 각 항목들의 json 데이터 가져옴
  factory User.fromJson(Map<String, dynamic> json) => User(
      int.parse(json['U_ID']),
      json['ID'],
      json['EMALE'],
      json['PASSWORD'],
      json['NAME'],
      json['PHONE']);

  Map<String, dynamic> toJson() => {
        'U_ID': user_id.toString(),
        'ID': user_regID,
        'EMALE': user_email,
        'PASSWORD': user_password,
        'NAME': user_name,
        'PHONE': user_phone
      };
}
