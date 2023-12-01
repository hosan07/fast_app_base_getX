import 'dart:math' as math;

import 'package:baseapp_getx/index.dart';

//로딩 애니메이션 위젯
class EasyCircularIndicator extends StatelessWidget {
  const EasyCircularIndicator({super.key, this.color, this.isUltra = false, this.isSmall = false});

  final Color? color;
  final bool isUltra;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final size = isUltra ? 240.0 : (isSmall ? 40.0 : 80.0);
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 864000.0 * 2.0 * math.pi, end: 0.0),
        duration: 864000.seconds,
        builder: (context, value, _) {
          return Transform.rotate(
            angle: value,
            child: Image.asset(
              'assets/png/circular.png',
              color: color ?? WtColors.x__grey4,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
