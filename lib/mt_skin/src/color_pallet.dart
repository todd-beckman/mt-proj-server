import 'constants.dart';

class BgColor extends MTSkinConstant {
  const BgColor._internal(String className) : super(className);

  static const BgColor White = const BgColor._internal('bg-white');
  static const BgColor Black = const BgColor._internal('bg-black');
  static const BgColor Primary = const BgColor._internal('bg-primary');
  static const BgColor Alternate = const BgColor._internal('bg-alt');
  static const BgColor Success = const BgColor._internal('bg-success');
  static const BgColor Warn = const BgColor._internal('bg-warn');
  static const BgColor Danger = const BgColor._internal('bg-danger');
  static const BgColor Gray = const BgColor._internal('bg-gray');

  static const List<BgColor> values = const [
    White,
    Black,
    Primary,
    Alternate,
    Success,
    Warn,
    Danger,
    Gray,
  ];
}

class TextColor extends MTSkinConstant {
  const TextColor._internal(String className) : super(className);

  static const TextColor White = const TextColor._internal('text-white');
  static const TextColor Black = const TextColor._internal('text-black');
  static const TextColor Primary = const TextColor._internal('text-primary');
  static const TextColor Alternate = const TextColor._internal('text-alt');
  static const TextColor Success = const TextColor._internal('text-success');
  static const TextColor Warn = const TextColor._internal('text-warn');
  static const TextColor Danger = const TextColor._internal('text-danger');
  static const TextColor Gray = const TextColor._internal('text-gray');

  static const List<TextColor> values = const [
    White,
    Black,
    Primary,
    Alternate,
    Success,
    Warn,
    Danger,
    Gray
  ];
}
