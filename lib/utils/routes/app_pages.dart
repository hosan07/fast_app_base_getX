import 'package:baseapp_getx/index.dart';
import 'package:baseapp_getx/pages/home/home.dart';
import 'package:baseapp_getx/pages/login/begin.dart';
import 'package:baseapp_getx/pages/login/login.dart';

import '../../pages/page2/page2.dart';
import '../../pages/page3/page3.dart';
import '../../pages/page4/page4.dart';
import '../../pages/page5/page5.dart';


part 'app_pages.home.dart';
part 'app_pages.page2.dart';
part 'app_pages.page3.dart';
part 'app_pages.page4.dart';
part 'app_pages.page5.dart';
part 'app_pages.routes.dart';

//앱 내에서 각 페이지를 관리하기 위한 GlobalKey 리스트
final List<GlobalKey<NavigatorState>> globalKeyList = List.generate(Frame.max.index, (index) => Get.nestedKey(index)!);

//**GetX 페이지 관리 - GetPage(
//1. name: '/binding'
// * 페이지를 식별하는 이름 또는 식별자
// * 페이지로 이동할 때 사용
//
//2. page: () => _Page()
// * 해당 클래스 경로로 이동할때 화면에 표시
//
//3. binding: _Binding()
// * 바인딩 클래스를 페이지에 연결
// * 바인딩은 페이지와 관련된 종속성을 초기화 하거나 설정
// * 바인딩은 dependencies 메서드에서 _Controller를 생성하여 GetX 컨트롤러로 등록 후
//   해당 페이지의 컨트롤러로 사용가능
// * 컨트롤러는 페이지와 관련된 로직을 처리(예- 상태관리, 애니메이션 처리 등)
//)
class AppPages {
  static final routes = [
    //*시작 페이지(스플래시)
    GetPage(
      name: Routes.begin,
      page: () => const BeginPage(),
      binding: BeginBinding(),
      transition: Transition.fade,
    ),
    //* 로그인 페이지
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    // //* 회원가입 페이지
    // GetPage(
    //   name: Routes.signUp,
    //   page: () => const SignUpPage(),
    //   binding: SignUpBinding(),
    //   children: [
    //     // 회원가입 인증 페이지
    //     GetPage(
    //       name: Routes.information,
    //       page: () => SignUpInformationPage(),
    //     ),
    //     //이메일
    //     GetPage(
    //       name: Routes.emailAuth,
    //       page: () => SignUpEmailAuthPage(),
    //     ),
    //     //비밀번호 인증 페이지
    //     GetPage(
    //       name: Routes.password,
    //       page: () => SignUpPasswordPage(),
    //     ),
    //   ],
    // ),
    //* frame(네비게이션 바)
    GetPage(
      name: Routes.frame,
      page: () => const FramePage(),
      binding: FrameBinding(),
      // transition: Transition.topLevel,
    ),
    //* 홈 페이지
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    //* 화면2
    GetPage(
      name: Routes.page2,
      page: () => Page2(),
      binding: Page2Binding(),
    ),
    //* 화면3
    GetPage(
      name: Routes.page3,
      page: () => Page3(),
      binding: Page3Binding(),
    ),
    //* 화면4
    GetPage(
      name: Routes.page4,
      page: () => Page4(),
      binding: Page4Binding(),
    ),
    //* 화면5
    GetPage(
      name: Routes.page5,
      page: () => Page5(),
      binding: Page5Binding(),
    ),

  ];
}
