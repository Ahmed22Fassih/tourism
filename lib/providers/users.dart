
import 'dart:io';

class User{

  final int id;
  final String token;
  final String username;
  final String password ;
  final String passwordConfirmed;
  final String email;
  final String phoneNumber;
  final String address;
  final File profilePic ;
  User({
    this.id,
    this.token,
    this.username,
    this.password,
    this.passwordConfirmed,
    this.email,
    this.phoneNumber,
    this.address,
    this.profilePic,
  });


//  factory User.fromJson(Map<String, dynamic> user) => User(
//      username: user['username'],
//      password: user['password'],
//      email: user['email'],
//      phoneNumber: user['phone']),
//      passwordConfirmed: user['password_confirmation'],
//      address: user['address']),
//      profilepic: user['profile_pic']
//  );

//  Map<String, dynamic> toJson() =>
//      {'username': username,'password': password , 'email':email , 'phone': phoneNumber , 'address': address , 'password_confirmation': passwordConfirmed , 'profile_pic': profilePic  };

}