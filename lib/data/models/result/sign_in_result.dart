class SignInResult {
  // 사용자 계정 인증 토큰
  String token;
  // 사용자 계정 인증 리프레시 토큰
  String refreshToken;
  // 만료 날짜 시간
  DateTime expiresIn;

  SignInResult({
    required this.token,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory SignInResult.fromMap(Map<String, dynamic> map) {
    return SignInResult(
      token: map['token'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      expiresIn: DateTime.parse(map['expiresIn']),
    );
  }
}
