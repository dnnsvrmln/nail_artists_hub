class NailSalon {
  final String id;
  final String companyName;
  final String firstName;
  final String insertion;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String adress;
  DateTime workdayStartTime;
  DateTime workdayEndTime;
  DateTime lunchStartTime;
  DateTime lunchEndtime;
  final int planDaysAhead;

  NailSalon({
    required this.id,
    required this.companyName,
    required this.firstName,
    this.insertion = 'INSERTION',
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.adress,
    required this.workdayStartTime,
    required this.workdayEndTime,
    required this.lunchStartTime,
    required this.lunchEndtime,
    required this.planDaysAhead,
  });
}
