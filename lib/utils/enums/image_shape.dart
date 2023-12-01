/// 이미지 모양
// ignore_for_file: constant_identifier_names
enum ImageShape {
  SQUARE('사각형 모양'),
  CIRCLE('원형 모양'),
  LEAF('잎 모양'),
  ONLY_SQUARE('라운드 없는 사각형');

  final String value;
  
  const ImageShape(this.value);

  @override
  String toString() {
    return value;
  }
}