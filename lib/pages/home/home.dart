import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';
import 'package:http/http.dart' as http;
import '../../data/db/databasehelper.dart';

part 'home.controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final now = DateFormat('yyyy.MM.dd').format(DateTime.now());
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTabIndex = homeController.selectedTabIndex.value;
    return Scaffold(
      backgroundColor: WtColors.h200,
      appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
              child: const AppBarTitle(titleText: '화면1')),
          //title: Text('d'),
          bottom: const WtBottomDivider()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///정상 작동
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: WtColors.h100,
                //color: WtColors.x__grey7,
                  border: Border(top: BorderSide(color: WtColors.x__grey8, width: 2))
              ),
              child: TabBar(
                controller: homeController.tabController,
                tabs: generateTabs(),
                labelStyle: WtTextStyle.s1b,
                onTap: (index) {
                  homeController.selectedTabIndex.value = index;
                  if(homeController.selectedTabIndex.value == 1){
                    hideLoading();
                  }
                  if(homeController.selectedTabIndex.value == 2){
                    hideLoading();
                  }
                },
                labelColor: WtColors.p100,
                indicatorColor: WtColors.p100,
                unselectedLabelColor: WtColors.x__grey7,
                unselectedLabelStyle: WtTextStyle.s1m.x__grey7,
                indicator: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: WtColors.p100,
                      width: 2,
                    ),
                  ),
                ),
                labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
            ),
            Obx(() {
              final selectedTabIndex = homeController.selectedTabIndex.value;
              return IndexedStack(
                index: selectedTabIndex,
                children: generateTabViews(),
              );
            }),
          ],
        ),
      ),
      //하단의 날씨 정보를 보여주는 바텀 뷰
      // bottomNavigationBar: const HomeWeatherDetailView(),
    );
  }
  List<Widget> generateTabs() {
    print('탭바 선택 사용자 : ${homeController.selectedTabIndex.value}');
    List<Widget> tabs = [
      Tab(
        text: '탭1',
      ),
      Tab(
        text: '탭2',
      ),
      Tab(
        text: '탭3',
      ),
    ];
    return tabs;
  }
  List<Widget> generateTabViews() {
    List<Widget> tabViews = [
      for (int i = 0; i < 3; i++)
        ///탭1
        if(homeController.selectedTabIndex.value == 0)
          Container(
            color: WtColors.h100,
            height: MediaQuery.of(context).size.height*0.5,
            child: Column(
              children: [
                EasyScrollView(
                  horizontal: 16.0,
                  vertical: 2,
                  children: [
                    PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.03),
                    Row(
                      children: [
                        PercentageSizedBox(widthFactor: 0.02, heightFactor: 0.0),
                        EasyText('텍스트1',style: WtTextStyle.h6b,),
                        Spacer(),
                        Container(
                            width: MediaQuery.of(context).size.width*0.3,
                            child: EasyOutlinedButton(
                            onPressed: () async {
                              var frameController = Get.find<FrameController>();
                              frameController.bottomIndex = 1;
                              },
                            //child: homeController.saveSelected.value  == false && homeController.surveyResults.isEmpty ? EasyText('평가하기', style: WtTextStyle.s1m,) : EasyText('평가 기록 보기', style: WtTextStyle.s1m,),
                            child: EasyText('버튼', style: WtTextStyle.s1m,),
                          type: EasyButtonType.base,)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ///탭2
        else if(homeController.selectedTabIndex.value == 1)
          Container(
            color: WtColors.h100,
            child: EasyText('텍스트1',style: WtTextStyle.h6b,)
          )
        ///기타정보 탭
        else if(homeController.selectedTabIndex.value == 2)
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            color: WtColors.h100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EasyScrollView(
                    horizontal: 16.0,
                    vertical: 1,
                    children: [
                      PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.02),
                      EasyText('날씨',style: WtTextStyle.h7b,),
                      PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.03),
                      EasyText('텍스트2',style: WtTextStyle.h7b,),
                      PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.04),
                    ],
                  ),
                  // HomeWeatherOutsideView()
                ],
              ),
          )
    ];
    return tabViews;
  }
}

