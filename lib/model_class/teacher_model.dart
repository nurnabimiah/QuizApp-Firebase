



class TeacherModelClass {
  String name;
  String email;
  String password;
  String phoneNumber;
  String uid;

  TeacherModelClass({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.uid
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'uid' : uid,
      'name' : name,
      'email' : email,
      'phoneNumber' : email,
      'password' : password,
    };
    return map;
  }



// factory StudentModel.fromJson(DocumentSnapshot snapshot){
//   return UserModel(
//     email: snapshot['email'],
//     name: snapshot['name'],
//     image: snapshot['image'],
//     date: snapshot['date'],
//     uid: snapshot['uid'],
//   );
// }





}