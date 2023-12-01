enum Module {
  otoscope('검이경'),
  stethoscope('청진기'),
  led('LED 치료기'),
  expiratory('호기 유량 측정기', '호기유량측정기'),
  asthma('알레르기케어'),
  rhinitis('비염치료'),
  nebulizer('네블라이저'),
  airMonitor('Air Monitor'),
  ;

  final String long, short;
  const Module(this.long, [this.short = '']);
  @override
  String toString() => long;
  String toShortString() => short.isEmpty ? long : short;
}
