import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';


part 'frame.controller.dart';

enum Frame {
  home,
  page2,
  page3,
  page4,
  page5,
  alarm,
  max,
}

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> with AfterLayoutMixin<FramePage> {
  @override
  void afterFirstLayout(BuildContext context) async {
    await checkPermission(Get.context!);


    // UserInfo를 구합니다.
    // if (await dataRepo.getUserInfo()) {
    //   final userInfo = dataRepo.userInfo!;
    //   final name = userInfo.name.isNullEmpty ? userInfo.email.split('@')[0] : userInfo.name;
    //   defaultSnackbar(null, '$name님 반갑습니다', bottom: false);
    // }
  }


  ///각 권한을 요청
  checkPermission(BuildContext context) async {
    //알람 권한
    // LocalNotification.requestPermission();
    // FocusScope.of(context).requestFocus(FocusNode());
    await [
      //Permission.camera,
      //if (isAndroid) Permission.storage,
      //Permission.photos,
      //Permission.bluetooth,
      //Permission.bluetoothScan,
      //Permission.bluetoothConnect,
      //Permission.bluetoothAdvertise,
      Permission.location
    ].request();
  }


  @override
  Widget build(BuildContext context) => _FramePage();
}

class _FramePage extends GetView<FrameController> {
  const _FramePage();
  void bottomChangePage(int index, {List<Widget> pages = const []}) async {
    log.info('Press BottomNavigationBar $index button.');
    controller.pageController.jumpToPage(index);
    //   Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    log.fine('FramePage');

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _frameView(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xFFF3F3F3), width: 1.0),
            ),
          ),
          child: Obx(()=>BottomNavigationBar(
            onTap: (index) => controller.bottomIndex = index,
            type: BottomNavigationBarType.fixed,
            items: _bottomMenu(controller.bottomIndex),
            currentIndex: controller.bottomIndex,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            selectedLabelStyle: WtTextStyle.caption.p100.h1_7,
            unselectedLabelStyle: WtTextStyle.caption.b500.h1_7,
          ))
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    controller.secondTouchTime = DateTime.now();
    if (controller.firstTouchTime != null &&
        controller.secondTouchTime.difference(controller.firstTouchTime!).inSeconds <= 2) {
      SystemNavigator.pop();
    } else {
      defaultSnackbar(null, '뒤로 버튼을 한번 더 누르시면 종료됩니다.');
      controller.firstTouchTime = DateTime.now();
    }
    return false;
  }

  ///네비게이션 메뉴 아이콘, 라벨
  _bottomMenu(int index) => <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/menu_home_${index == 0 ? 'fill' : 'line'}.svg'),
      label: "화면1",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/menu_home_${index == 1 ? 'fill' : 'line'}.svg'),
      label: "화면2",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/menu_home_${index == 2 ? 'fill' : 'line'}.svg'),
      label: "화면3",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/menu_home_${index == 3 ? 'fill' : 'line'}.svg'),
      label: "화면4",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/menu_home_${index == 4 ? 'fill' : 'line'}.svg'),
      label: "화면5",
    ),
  ];

  Widget _frameView() => PageView(
    controller: controller.pageController,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      //홈 페이지 상태 유지하기
      AutomaticKeepAliveScreen(child: navigatorHome),
      navigatorPage2,
      navigatorPage3,
      navigatorPage4,
      navigatorPage5,
    ],
  );
}
