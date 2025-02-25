class UpdateUserDto {
  final int userid;
  final String firstName;
  final String lastName;
  final String phone;
  final String gender;
  final String dateofBirth;
  final String address;
  final String email;
  final String? profilePic;
  final String state;
  final String bio;
  final String qualification;
  final String aadhaar;
  final String occupation;

  UpdateUserDto(
      {required this.userid,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.dateofBirth,
      required this.gender,
      required this.address,
      required this.email,
      this.profilePic,
      required this.state,
      required this.bio,
      required this.qualification,
      required this.aadhaar,
      required this.occupation});
  Map<String, dynamic> toJson() {
    return {
      "id": userid,
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "email": email,
      "gender": gender,
      "address": address,
      "date_of_birth": dateofBirth,
      "profile_pic": profilePic,
      "state": state,
      "bio": bio,
      "qualification": qualification,
      "aadhaar": aadhaar,
      "occupation": occupation
    };
  }
}
