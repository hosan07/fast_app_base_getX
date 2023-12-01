enum WtStatus {
  none('상태없음'),
  loading('불러오는 중'),
  failed('실패'),
  empty('자료없음'),
  success('성공'),
  abnormal('비정상적'), // 갱신할 때 오류
  ;

  final String value;

  const WtStatus(this.value);

  @override
  String toString() => value;
}
