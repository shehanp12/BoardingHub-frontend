class BoardingProvider {

  String username = '';
  String fullName = '';
  String email = '';
  String password = '';

  BoardingProvider(
      String username, String fullName, String email, String password) {
    this.username = username;
    this.fullName = fullName;
    this.email = email;
    this.password = password;
  }


  // BoardingProvider.fromJson(Map<String, String> json)
  //     :
  //       username = json["username"],
  //       fullName = json["fullName"],
  //       email = json["email"],
  //       password = json["password"];
  //
  // Map<String, String> toJson() => {
  //
  //       'username': username,
  //       'fullName': fullName,
  //       'email': email,
  //       'password': password
  //     };
}
