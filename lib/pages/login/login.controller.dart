part of 'login.dart';

class LoginController extends GetxController {
  //final HomeController homeController = Get.find<HomeController>();
  RxList LoginControllerUserList = [].obs;

  void updateUserList(List<String> userList) {
    LoginControllerUserList.assignAll(userList);
  }

  Future<void> handleLoginButtonPressed() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Get.offAllNamed(Routes.home);
      Get.offAllNamed(Routes.frame);
    });
  }
  Timer? tokenExpirationTimer;
  Future<void> login() async {
    log.fine('onPressed - EasyElevatedButton / 로그인');
    showLoading();

    ///API 예
    // final loginData = {
    //   'email': idController.text,
    //   'password': passwdController.text,
    // };
    //final url = '';
    //final body = json.encode(loginData);
    // try {
    //   if (response.statusCode == 200) {
    //     final responseBody = utf8.decode(response.bodyBytes);
    //     await Get.offAllNamed(Routes.frame);
    //   } else {
    //     // Handle login failure
    //     defaultSnackbar(
    //       '로그인 실패',
    //       '이메일 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.',
    //     );
    //   }
    // } catch (error) {
    //   showHomeNetworkCheck();
    //   print('$error');
    //   // showisConnectivity();
    //   //defaultSnackbar('로그인 실패', '인터넷 연결 상태를 확인해주세요.');
    // }

    ///네비게이션 홈 화면 이동
    Future.delayed(Duration(seconds: 1), () async {
      hideLoading();
      await Get.offAllNamed(Routes.frame);
    });


  }


  late final GlobalKey<FormState> formKey;

  late final TextEditingController idController; // 컨트롤
  final idFocus = FocusNode(); // 포커스
  final idAutovalidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
  bool _isEnabledid = false; // 올바른 이메일
  set isEnabledid(bool value) => isNextButton((_isEnabledid = value) && _isEnabledPasswd);

  late final TextEditingController passwdController; // 컨트롤
  final visiblePasswd = RxBool(false); // 보이기 / 감추기
  bool _isEnabledPasswd = false; // 올바른 비밀번호
  set isEnabledPasswd(bool value) => isNextButton(_isEnabledid && (_isEnabledPasswd = value));

  String? errorid; // 이메일의 서버에러 accountDoesNotExist
  String? errorPasswd; // 비밀번호의 서버에러 accountPasswordDoesNotMatch

  final isNextButton = false.obs; // 로그인 버튼


  @override
  void onInit() async {

    print('logincontroller userList: $LoginControllerUserList');
    super.onInit();
    formKey = GlobalKey<FormState>();

    idController = TextEditingController(text: isDebugMode ? 'qq@ruu.kr' : 'qq@ruu.kr');
    passwdController = TextEditingController(text: isDebugMode ? 'Qq111111' : 'Qq111111');

    isEnabledid = idController.text.isEmail;
    isEnabledPasswd = passwdController.text.length >= 6;
  }

  @override
  void onClose() {
    idController.dispose();
    passwdController.dispose();

    super.onClose();
  }
}


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    //et.put(HomeController());
  }
}
