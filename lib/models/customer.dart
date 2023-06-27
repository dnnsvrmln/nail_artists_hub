class Customer {
  final String id;
  final String firstName;
  final String? insertion;
  final String lastName;
  final String email;
  final String phoneNumber;

  const Customer({
    required this.id,
    required this.firstName,
    this.insertion,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'insertion': insertion,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}
