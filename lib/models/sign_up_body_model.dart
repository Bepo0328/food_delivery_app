class SignUpBody {
  String email;
  String password;
  String phone;
  String name;

  SignUpBody({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['f_name'] = name;

    return data;
  }
}
