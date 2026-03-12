// {
//   "code": "1",
//   "msg": "操作成功",
//   "result": {
//     "id": "11",
//     "account": "ceshi01",
//     "mobile": "13200000001",
//     "token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCLmvZjnu5_kuIDlj6_niLHmjY9cIixcImlkXCI6XCIxMVwiLFwidXNlcm5hbWVcIjpcImNlc2hpMDFcIn0iLCJpYXQiOjE3NzMzMDMxMjMsImV4cCI6MTc3MzU2MjMyM30.6DvTC2IwC21LEp4sf9zwTWad3k5oBX9GrTvrXIJ2nqE",
//     "avatar": "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/avatar/2025-08-01/d265d9df-4e88-4c37-8961-150ae7d97759.jpeg",
//     "nickname": "潘统一可爱捏",
//     "gender": "未知",
//     "birthday": "1981-03-11",
//     "cityCode": "120100",
//     "provinceCode": "120000",
//     "profession": "教师"
//   }
// }

class UserInfo{
  String id;
  String account;
  String mobile;
  String token;
  String avatar;
  String nickname;
  String gender;
  String birthday;
  String cityCode;
  String provinceCode;
  String profession;

  UserInfo({
    required this.id,
    required this.account,
    required this.mobile,
    required this.token,
    required this.avatar,
    required this.nickname,
    required this.gender,
    required this.birthday,
    required this.cityCode,
    required this.provinceCode,
    required this.profession,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json["id"] ?? "",
      account: json["account"] ?? "",
      mobile: json["mobile"] ?? "",
      token: json["token"] ?? "",
      avatar: json["avatar"] ?? "",
      nickname: json["nickname"] ?? "",
      gender: json["gender"] ?? "",
      birthday: json["birthday"] ?? "",
      cityCode: json["cityCode"] ?? "",
      provinceCode: json["provinceCode"] ?? "",
      profession: json["profession"] ?? "",
    );
  }

}