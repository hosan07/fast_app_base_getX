// ignore_for_file: constant_identifier_names

enum UrlType {
  INTERNET('인터넷'),
  TEL('전화'),
  SMS('문자'),
  EMAIL('이메일');

  final String value;

  const UrlType(this.value);

  @override
  String toString() {
    return value;
  }
}
