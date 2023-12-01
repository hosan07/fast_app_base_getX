enum BodyStatus {
  enable('활성화'),
  charging('충전중'),
  needToCharge('충전필요'),
  disable('비활성화'),
  // chargingComplete('충전완료'),
  ;

  final String value;

  const BodyStatus(this.value);

  @override
  String toString() => value;
}
