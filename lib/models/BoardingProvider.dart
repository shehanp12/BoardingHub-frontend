class BoardingProvider{
  String uid = '';
  String username = '';
  String fullName = '';
  String email = '';
  String password = '';

  BoardingProvider(
      String uid,
      String username,
      String fullName,
      String email,
      String password){
    this.uid=uid;
    this.username= username;
    this.fullName= fullName;
    this.email = email;
    this.password = password;
  }

  factory BoardingProvider.fromJson(Map<String,dynamic> json){
    
    return BoardingProvider(
        json["uid"],
        json["username"], 
        json["fullName"],
        json["email"],
        json["password"]);
  }

  Map<String,dynamic> toJson() =>{
    'uid':uid,
    'username':username,
    'fullName':fullName,
    'email':email,
    'password':password



  };

}