part of 'easy_outlined_button.dart';

//테두리 버튼 스타일
ButtonStyle get _subRedButton => OutlinedButton.styleFrom(
      foregroundColor: WtColors.x__subRed,
    ).copyWith(
      side: materialStateBorder(WtColors.x__subRed, WtColors.x__subRed.withOpacity(0.5)),
      overlayColor: materialSolidColor(WtColors.x__subRed.withOpacity(0.05)),
    );

ButtonStyle get _smallButton => ElevatedButton.styleFrom(
      textStyle: WtTextStyle.x__size14B,
      minimumSize: const Size.fromHeight(28),
      padding: EdgeInsets.zero,
    );

ButtonStyle get _testButton => OutlinedButton.styleFrom(
  backgroundColor: Colors.transparent,
  foregroundColor: WtColors.black,
  side: BorderSide(width: 1.0, color: Color(0xFFE7E7E7)),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(7.0), // Adjust the radius as needed
  ),
  minimumSize: const Size(64, 58),
);

ButtonStyle get _testButton2 => OutlinedButton.styleFrom(
    backgroundColor: Color(0xFFEEF2F6),
    foregroundColor: WtColors.p100,
    side: BorderSide(width: 0.0, color: Colors.transparent),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
    ),
    minimumSize: const Size(50, 35),
);

ButtonStyle get _baseButton => OutlinedButton.styleFrom(
  backgroundColor: WtColors.p100,
  foregroundColor: WtColors.white,
  side: BorderSide(width: 0.0, color: Colors.transparent),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
  ),
  minimumSize: const Size(50, 40),
);

ButtonStyle get _dosageButton1 => OutlinedButton.styleFrom(
  backgroundColor: WtColors.p100,
  foregroundColor: WtColors.white,
  side: BorderSide(width: 0.0, color: Colors.transparent),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
  ),
  minimumSize: const Size(50, 40),
);

ButtonStyle get _dosageButton2 => OutlinedButton.styleFrom(
  backgroundColor: Color(0xFFF3F3F3),
  foregroundColor: WtColors.x__grey7,
  side: BorderSide(width: 0.0, color: Colors.transparent),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
  ),
  minimumSize: const Size(50, 40),
);

ButtonStyle get _grayscaleButton => OutlinedButton.styleFrom(
  backgroundColor: Color(0xFF4C4C4C),
  foregroundColor: WtColors.white,
  side: BorderSide(width: 0.0, color: Colors.transparent),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
  ),
  minimumSize: const Size(50, 35),
);

ButtonStyle get _transButton => OutlinedButton.styleFrom(
  backgroundColor: Color(0xFFF8F8F8),
  foregroundColor: Color(0xFFF8F8F8),
  side: BorderSide(width: 0.0, color: Color(0xFFF8F8F8)),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
  ),
  minimumSize: const Size(50, 35),
);

ButtonStyle get _instagramButton => OutlinedButton.styleFrom(
  backgroundColor: Color(0xFF4C4C4C),
  foregroundColor: WtColors.white,
  side: BorderSide(width: 0.0, color: Colors.transparent),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
  ),
  minimumSize: const Size(64, 59),
);
