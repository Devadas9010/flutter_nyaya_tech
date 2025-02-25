class AddUserDto {
  final String firstName;
  final String lastName;
  final String gender;
  final String state;
  AddUserDto(
      {required this.firstName,
      required this.lastName,
      required this.gender,
      required this.state});
  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "gender": gender,
      "state": state
    };
  }
}
