enum ServiceState {
  loading('loading'),
  success('success'),
  failed('failed'),
  ;

  final String state;
  const ServiceState(this.state);
  @override
  String toString() => state;
}
