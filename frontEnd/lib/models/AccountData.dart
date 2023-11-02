class AccountData {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String password;
  final String phoneNumber;

  AccountData({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.password,
    required this.phoneNumber,
});
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}