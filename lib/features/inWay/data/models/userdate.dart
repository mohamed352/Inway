class UserDate {
  String? name;
  String? email;
  String? image;
  String? phone;
  dynamic dateTime;
  dynamic birthdate;
  bool? emailVerictions;
  String? uid;
  String? token;
  UserDate(
      {this.birthdate,
      this.dateTime,
      this.email,
      this.emailVerictions,
      this.image,
      this.name,
      this.phone,
      this.token,
      this.uid});
  UserDate.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    birthdate = json['birthdate'];
    dateTime = json['dateTime'];
    email = json['email'];
    emailVerictions = json['emailVerictions'];
    image = json['image'];
    phone = json['phone'];
    token = json['token'];
    uid = json['uid'];
  }
  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uid': uid,
      'emailVerictions': emailVerictions,
      'image': image,
     'birthdate':birthdate,
     'dateTime':dateTime,
      'token': token,
     
    };
  }
}
