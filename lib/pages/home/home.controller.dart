part of 'home.dart';

class HomeController extends EasyController with GetTickerProviderStateMixin {
  //final DatabaseHelper _databaseHelper = DatabaseHelper();
  RxString accessToken = ''.obs;

  final multiBody = RxnBool(null); // 다중 바디 여부를 나타내는 RxnBool 변수

  // 모듈들의 상태를 관리하는 List (Observable List)
  final List modules = [].obs;

  // 바디 확장 및 축소에 사용되는 RxBool 변수
  final bodyExpansion = true.obs; // 바디 확장 여부
  final bodyCollapse = false.obs; // 바디 축소 여부

  // Tab 컨트롤러와 Page 컨트롤러들
  late final TabController tabController; // 홈 탭 컨트롤러
  late final TabController tabController2; // 실내/실외 탭 컨트롤러
  late final PageController weatherController; // 날씨 페이지 컨트롤러
  late final PageController outsideController; // 외부 페이지 컨트롤러

  RxInt selectedTabIndex = 0.obs;

  // 바텀 확장 및 축소에 사용되는 RxBool 변수
  final bottomExpansion = false.obs; // 바텀 확장 여부
  final bottomCollapse = true.obs; // 바텀 축소 여부

  // 대기 등급과 대기 상태 이미지들을 나타내는 리스트들
  final grades = <String>['좋음', '보통', '나쁨', '매우나쁨', '점검중']; // 대기 등급
  final images = <String>[
    'assets/png/wt_air1.png',
    'assets/png/wt_air2.png',
    'assets/png/wt_air3.png',
    'assets/png/wt_air4.png',
    'assets/png/wt_air5.png'
  ]; // 대기 상태 이미지


  @override
  void onInit() async {
    super.onInit();
    hideLoading();
    // 컨트롤러 초기화 시 실행될 코드
    tabController = TabController(initialIndex: 0, length: 3, vsync: this); // 탭 컨트롤러 초기화
    tabController2 = TabController(initialIndex: 0, length: 2, vsync: this); // 탭 컨트롤러 초기화
    weatherController = PageController(initialPage: 0); // 날씨 페이지 컨트롤러 초기화
    outsideController = PageController(initialPage: 0); // 외부 페이지 컨트롤러 초기화
    // alarmRepo.init();
    // weatherRepo.autoData();
  }

  @override
  void onClose() {
    super.onClose();
    // 컨트롤러 종료 시 실행될 코드
    tabController.dispose(); // 탭 컨트롤러 종료
    tabController2.dispose(); // 탭 컨트롤러 종료
    weatherController.dispose(); // 날씨 페이지 컨트롤러 종료
    outsideController.dispose(); // 외부 페이지 컨트롤러 종료
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController()); // HomeController를 의존성으로 등록
  }
}
