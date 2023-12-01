// 다양한 패키지와 클래스들을 한 곳에서 관리하는 export 선언

//* 기본 패키지
export 'package:flutter/material.dart';

//* Dart 패키지
export 'dart:io';
export 'dart:async';



//* Flutter 패키지
export 'package:flutter/services.dart';

//* 로컬 알림 관련
export 'package:baseapp_getx/notifications/local_notification.dart';

//* 페이지 관련련
export 'package:baseapp_getx/pages/frame.dart';

//* 유틸리티 관련
// 추상 클래스
// 열거형
export 'package:baseapp_getx/utils/enums/body_status.dart';
export 'package:baseapp_getx/utils/enums/image_shape.dart';
export 'package:baseapp_getx/utils/enums/play_state.dart';
export 'package:baseapp_getx/utils/enums/service_state.dart';
export 'package:baseapp_getx/utils/enums/url_type.dart';
export 'package:baseapp_getx/utils/enums/wt_status.dart';

//* 기본 & 공통 위젯
//   공통 위젯
export 'package:baseapp_getx/utils/widgets/common_widget/automatic_keep_alive_screen.dart';
export 'package:baseapp_getx/utils/widgets/common_widget/ink_highlight.dart';
export 'package:baseapp_getx/utils/widgets/common_widget/flutter_overlay_loader.dart';

//   구성 요소 위젯
export 'package:baseapp_getx/utils/widgets/component_widget/wt_divider.dart';
export 'package:baseapp_getx/utils/widgets/component_widget/wt_loading_view.dart';
export 'package:baseapp_getx/utils/widgets/component_widget/wt_radio_button.dart';
export 'package:baseapp_getx/utils/widgets/component_widget/wt_sized_box.dart';
export 'package:baseapp_getx/utils/widgets/component_widget/wt_tab_bar.dart';
export 'package:baseapp_getx/utils/widgets/component_widget/wt_text_form_field.dart';
export 'package:baseapp_getx/utils/widgets/component_widget/wt_appbar_title.dart';
export 'package:baseapp_getx/utils/widgets/component_widget/wt_mediaquery_ratio.dart';

export 'package:baseapp_getx/utils/extension/style.dart';
export 'package:baseapp_getx/utils/extension/widget.dart';
export 'package:baseapp_getx/utils/extension/string.dart';
export 'package:baseapp_getx/utils/extension/list.dart';
export 'package:baseapp_getx/utils/extension/iterable/iterable_double.dart';
export 'package:baseapp_getx/utils/extension/iterable/iterable_int.dart';
export 'package:baseapp_getx/utils/extension/iterable/iterable_object.dart';
export 'package:baseapp_getx/utils/extension/iterable/_iterable.dart';
export 'package:baseapp_getx/utils/extension/datetime.dart';


//   간편 위젯
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_button_type.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_elevated_button.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_outlined_button.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_constraints.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_text.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_text_button.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_text_label_field.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_view.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_circular_indicator.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_layout.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_cupertino_switch.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_dialog_action.dart';
export 'package:baseapp_getx/utils/widgets/easy_widget/easy_icon_button.dart';
export 'package:baseapp_getx/utils/abstract/_abstract.dart';
export 'package:baseapp_getx/pages/often/arrow_tile.dart';

//* 루트 관련
export 'package:baseapp_getx/utils/routes/app_pages.dart';
export 'package:baseapp_getx/utils/color.dart';
export 'package:baseapp_getx/utils/font_weight.dart';
export 'package:baseapp_getx/utils/style.dart';
export 'package:baseapp_getx/utils/theme.dart';
export 'package:baseapp_getx/utils/utility.dart';


//*다이어로그
export 'package:baseapp_getx/pages/home/dialog/home_network_check.dart';

//* 메인 관련
export 'package:baseapp_getx/global.dart';
export 'package:baseapp_getx/main.dart';
export 'package:baseapp_getx/resource.dart';


//* 패키지
export 'package:after_layout/after_layout.dart';
export 'package:flutter_svg/svg.dart';
export 'package:get/get.dart' hide HeaderValue;
export 'package:get_storage/get_storage.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:easy_localization_loader/easy_localization_loader.dart';
export 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
export 'package:synchronized/synchronized.dart';
export 'package:cron/cron.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:loading_animation_widget/loading_animation_widget.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:package_info_plus/package_info_plus.dart';