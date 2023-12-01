// import 'package:baseapp_getx/index.dart';
// import 'package:path_provider/path_provider.dart';
//
// class RegionRepository extends GetxController {
//   final _regions = <List<String>>[];
//   List<List<String>>? steps1;
//   List<List<String>>? steps2;
//   List<List<String>>? steps3;
//   List<List<String>>? search;
//   List<String>? curRegion;
//
//   void clear() {
//     _regions.clear();
//     steps1 = null;
//     steps2 = null;
//     steps3 = null;
//     search = null;
//   }
//
//   Future<void> loadRegions() async {
//     clear();
//     steps1 = <List<String>>[];
//     final arrays = (await rootBundle.loadString('assets/weather.csv')).split('\n');
//     String textStep1 = '', textStep2 = '';
//     for (final array in arrays) {
//       final split = array.split(',');
//       // 중복된 값 넣는 루틴
//       if (split[0].isEmpty) {
//         split[0] = textStep1;
//         if (split[1].isEmpty) {
//           split[1] = textStep2;
//         } else {
//           textStep2 = split[1];
//         }
//       } else {
//         textStep1 = split[0];
//         textStep2 = '';
//       }
//       _regions.add(split);
//       if (split[1].isEmpty) {
//         steps1!.add(split);
//       }
//     }
//     update();
//   }
//
//   Future<void> saveRegions() async {
//     await loadRegions();
//
//     Directory path = await getApplicationDocumentsDirectory();
//     File file = File('${path.path}/weather.csv');
//
//     _regions.sort((a, b) {
//       int step1 = a[0].compareTo(b[0]);
//       if (step1 == 0) {
//         int step2 = a[1].compareTo(b[1]);
//         if (step2 == 0) {
//           return a[2].compareTo(b[2]);
//         }
//         return step2;
//       }
//       return step1;
//     });
//
//     // 중복된 것 빼는 루틴!
//     String textStep1 = '', textStep2 = '';
//     for (final region in _regions) {
//       if (region[0] == textStep1) {
//         region[0] = '';
//         if (region[1] == textStep2) {
//           region[1] = '';
//         } else {
//           textStep2 = region[1];
//         }
//       } else {
//         textStep1 = region[0];
//         textStep2 = '';
//       }
//
//       //! 좌표계 변환
//       //! WGS84 좌표계 => 한국 TM
//     }
//
//     final buffer = StringBuffer();
//     for (final region in _regions) {
//       buffer.writeAll(region, ',');
//       buffer.writeln();
//     }
//     String textRegions = buffer.toString();
//     File copy = await file.writeAsString(textRegions.substring(0, textRegions.length - 1));
//     copy.path; //! 여기에 breakpoint! 이 값을 복사해서 폴더 이동에 붙여 넣으세요.
//   }
//
//   void enumerateStep2(String step1) {
//     steps2 = <List<String>>[];
//     for (final region in _regions) {
//       if (region[0] == step1 && /* region[1].isNotEmpty && */ region[2].isEmpty) {
//         steps2!.add(region);
//       }
//     }
//     update();
//   }
//
//   void enumerateStep3(String step1, String step2) {
//     steps3 = <List<String>>[];
//     for (final region in _regions) {
//       if (region[0] == step1 && region[1] == step2 /* && region[2].isNotEmpty */) {
//         steps3!.add(region);
//       }
//     }
//     update();
//   }
//
//   void searchRegions(String text) {
//     if (text.isEmpty) {
//       search = null;
//     } else {
//       search = <List<String>>[];
//       for (final region in _regions) {
//         if (region[0].contains(text) || region[1].contains(text) || region[2].contains(text)) {
//           search!.add(region);
//         }
//       }
//     }
//     update();
//   }
// }
