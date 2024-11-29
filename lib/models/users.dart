class Users {
    int? idUser;
    String userEmail;
    String userpassword;

    Users({
        this.idUser,
        required this.userEmail,
        required this.userpassword,
    });

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        idUser: json["idUser"],
        userEmail: json["userEmail"],
        userpassword: json["userpassword"],
    );

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "userEmail": userEmail,
        "userpassword": userpassword,
    };
}
