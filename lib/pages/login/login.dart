import 'package:baseapp_getx/index.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../data/db/databasehelper.dart';
import '../home/dialog/token_error.dart';
import '../home/home.dart';
part 'login.controller.dart';

class LoginPage extends EasyView<LoginController> {
  LoginPage({super.key});
  final isPasswordEntered = RxBool(false);
  final isRunning = RxBool(false);
  final isClick = RxBool(false);
  final isRunning2 = RxBool(false);
  final isClick2 = RxBool(false);

  /// 비밀번호 유효성 검사
  bool isValidPassword(String password) {
    // Define a regular expression pattern for password validation without special characters
    RegExp passwordPattern = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$');
    return passwordPattern.hasMatch(password);
  }


  @override
  Widget render(BuildContext context) => Scaffold(
    body: KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: EasyScrollView(
        formKey: controller.formKey,
        vertical: null,
        bottom: false,
        children: [
          PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.1),
          EasyText('로그인', style: WtTextStyle.h5b.black, alignment: Alignment.center,),
          PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.05),
          Obx(
                  () => SizedBox(
                height: 80,
                child: GestureDetector(
                  child: EasyTextLabelField(
                    labelText: 'ID',
                    strutStyle: StrutStyle(height: 1),
                    cursorHeight: 20,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height:1,
                        decorationThickness: 0
                    ),
                    textAlign: TextAlign.start,
                    maxLength: 13,
                    controller: controller.idController,
                    focusNode: controller.idFocus,
                    autovalidateMode: controller.idAutovalidateMode.value,
                    onChanged: (value){
                      if(controller.idController.text.isNotEmpty){
                        controller._isEnabledid = true;
                      }
                    },
                    decoration: InputDecoration(
                      helperText: '',
                      helperStyle: TextStyle(color: WtColors.negative),
                      prefixText: '',
                      counterText: '',
                      prefixStyle: WtTextStyle.h7b,
                      prefixIconColor: Color(0xFF808080),
                    ),
                    keyboardType: TextInputType.emailAddress, maxLines: '1',
                  ),
                ),
              )
          ),
          PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.005),
          Obx(
                  () => SizedBox(
                    height: 80,
                    child: GestureDetector(
                      child: EasyTextLabelField(
                        labelText: 'PW',
                        strutStyle: StrutStyle(height: 1),
                        cursorHeight: 20,
                        cursorColor: Colors.black,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height:1,
                            decorationThickness: 0
                        ),
                        textAlign: TextAlign.start,
                        maxLength: 16,
                        controller: controller.passwdController,
                        onChanged: (value) {
                          isClick.value = true;
                          print(isClick.value);
                          if((isValidPassword(controller.passwdController.text)) == true){
                            isRunning.value = true;
                          } else if(((isValidPassword(controller.passwdController.text)) == false) || controller.passwdController.text.isEmpty) {
                            isRunning.value = false;
                          }
                          isPasswordEntered.value = false;
                          controller.isEnabledPasswd = value.length >= 8;
                          if(!isValidPassword(controller.passwdController.text)){
                            controller.isEnabledPasswd = false;
                          }
                        },
                        onTap: (){
                          //print('d$isPasswordEntered');
                          if (isPasswordEntered.value == true) {
                            isRunning.value = false;
                            controller.isEnabledPasswd = false;
                            controller.passwdController.clear();
                          }
                          isPasswordEntered.value = true;
                          //isPasswordEntered = false;  // Set the flag to indicate password has been entered
                        },
                        onCleared: () {
                          isRunning.value = false;
                          controller.isEnabledPasswd = false;
                          isPasswordEntered.value = true;
                        },
                        onFocusChange: (value) {
                          // if (!value) {
                          //   if ((!value && controller.passwdController.text.isNotEmpty) && (isValidPassword(controller.passwdController.text))) {
                          //     if (controller.passwdController.text.checkPassword) {
                          //       controller.update();
                          //       isPasswordEntered.value = true;
                          //       return const InputDecoration(helperText: '');
                          //     } else {
                          //       controller.update();
                          //       isPasswordEntered.value = true;
                          //       controller.isEnabledPasswd = false;
                          //       //return const InputDecoration(focusColor: WtColors.negative, helperText: '숫자, 영문 대∙소문자, 특수문자 8자 이상');
                          //     }
                          //   } else {
                          //     controller.update();
                          //     isPasswordEntered.value = true;
                          //     controller.isEnabledPasswd = false;
                          //     //return const InputDecoration(focusColor: WtColors.negative, helperText: '숫자, 영문 대∙소문자, 특수문자 8자 이상');
                          //   }
                          // }
                          return null;
                        },
                        decoration: InputDecoration(
                          helperText: ((isClick.value == false) || (isRunning.value == true)) ? '' : '숫자, 영문 대∙소문자 8자 이상',
                          helperStyle: TextStyle(color: WtColors.negative),
                          prefixText: '',
                          counterText: '',
                          prefixStyle: WtTextStyle.h7b,
                          prefixIconColor: Color(0xFF808080),
                        ),
                        obscureText: !controller.visiblePasswd.value,
                        keyboardType: TextInputType.text, maxLines: '',
                      ),
                    ),
                  )
          ),
          PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.005),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: WtColors.white,
              backgroundColor: WtColors.p100,
              //minari++ 기본 버튼 선택 시 색상 변경
              disabledForegroundColor: WtColors.white,
              disabledBackgroundColor: WtColors.x__grey2,
              minimumSize: const Size(64, 58),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              textStyle: WtTextStyle.h7m,
            ),
            onPressed: controller.isNextButton.value
                ? () async {
              ///로그인 API 요청
              await controller.login();
              //controller.handleLoginButtonPressed();
              print('로그인');
            }
                : null,
            child: Text('로그인'),
          ),
        ],
      ),
    ),
  );
}

double tabBarHeight(BuildContext context) {
  // 화면의 높이를 가져오기
  double screenHeight = MediaQuery.of(context).size.height;

  // 원하는 비율에 맞게 탭바의 높이를 계산 (예: 화면 높이의 18%)
  double tabBarHeight = screenHeight * 0.23;

  // 예외적으로 특정 화면 크기에 대한 처리를 할 수도 있습니다.
  if (screenHeight > 900) {
    tabBarHeight = screenHeight * 0.015; // 화면 높이의 15%로 설정 (아이폰 14 Pro 이상)
  }  else if (screenHeight > 800) {
    tabBarHeight = screenHeight * 0.017;
  } else if (screenHeight > 700) {
    tabBarHeight = screenHeight * 0.018;
  } else if (screenHeight > 600) {
    tabBarHeight = screenHeight * 0.020;
  } else if (screenHeight > 500) {
    tabBarHeight = screenHeight * 0.021;
  }

  return tabBarHeight;
}