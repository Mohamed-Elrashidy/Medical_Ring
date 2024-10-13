class UserAccountModel{
  String name;
  String email;
  String userId;
  String phoneNumber;
  List<String> ringsIds;

  UserAccountModel({
    required this.name,
    required this.email,
    required this.userId,
    required this.phoneNumber,
    required this.ringsIds,
  });

  static const String NAME_KEY = 'Name_Key';
  static const String EMAIL_KEY = 'Email_Key';
  static const String USER_ID_KEY = 'User_Id_Key';
  static const String PHONE_NUMBER_KEY = 'Phone_Number_Key';
  static const String RINGS_IDS_KEY = 'Rings_Ids_Key';

 factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      name: json[NAME_KEY],
      email: json[EMAIL_KEY],
      userId: json[USER_ID_KEY],
      phoneNumber: json[PHONE_NUMBER_KEY],
      ringsIds: List<String>.from(json[RINGS_IDS_KEY]),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data[NAME_KEY] = name;
    data[EMAIL_KEY] = email;
    data[USER_ID_KEY] = userId;
    data[PHONE_NUMBER_KEY] = phoneNumber;
    data[RINGS_IDS_KEY] = ringsIds;
    return data;
  }

}