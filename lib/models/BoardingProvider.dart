class BoardingProvider{

  String username = '';
  String fullName = '';
  String email = '';
  String password = '';

  BoardingProvider(
      String username,
      String fullName,
      String email,
      String password){
    this.username= username;
    this.fullName= fullName;
    this.email = email;
    this.password = password;
  }

  factory BoardingProvider.fromJson(Map<String,dynamic> json){
    
    return BoardingProvider(
        json["username"], 
        json["fullName"],
        json["email"],
        json["password"]);
  }

  Map<String,dynamic> toJson() =>{
    'username':username,
    'fullName':fullName,
    'email':email,
    'password':password



  };

}