part of 'app_pages.dart';

/// 앱 내의 모든 경로를 관리하는 클래스
/// 앱 내에서 해당 페이지를 나타내기 위함이며, 유지보수에 용이
abstract class Routes {

  //* 시작
  /// 시작 페이지
  static const begin = '/begin';

  //* 로그인
  /// 로그인 페이지
  static const login = '/login';

  //* 회원가입
  // /// 회원가입 페이지의 경로를 나타냄
  // static const signUp = '/signUp';
  // /// 사용자 권한 동의 페이지의 경로를 나타냄
  // static const permission = '/permission';
  // /// 사용자 동의 페이지의 경로를 나타냄
  // static const agreement = '/agreement';
  // /// 이메일 입력 페이지의 경로를 나타냄
  // static const email = '/email';
  // /// 이메일 인증 페이지의 경로를 나타냄
  // static const emailAuth = '/emailAuth';
  // /// 비밀번호 입력 페이지의 경로를 나타냄
  // static const password = '/password';

  /// 프레임 페이지
  static const frame = '/frame';

  /// 화면의 경로
  static const home = '/home';
  static const page2 = '/page2';
  static const page3 = '/page3';
  static const page4 = '/page4';
  static const page5 = '/page5';

}
