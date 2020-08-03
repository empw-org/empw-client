class EditProfileData{
  String name;
  String email;
  String password;
  String avgSal;

 EditProfileData({
     this.name,
     this.email,
     this.password,
     this.avgSal,
    
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "salary": avgSal,
    };
  }
}

