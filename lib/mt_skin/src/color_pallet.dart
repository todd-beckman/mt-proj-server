import 'constants.dart';

class BgColor extends MTSkinConstant {
  BgColor._internal(String className) : super(className);

  static final BgColor White = new BgColor._internal('bg-white');
  static final BgColor Black = new BgColor._internal('bg-black');
  static final BgColor Primary = new BgColor._internal('bg-primary');
  static final BgColor Alternate = new BgColor._internal('bg-alt');
  static final BgColor Success = new BgColor._internal('bg-success');
  static final BgColor Warn = new BgColor._internal('bg-warn');
  static final BgColor Danger = new BgColor._internal('bg-danger');
  static final BgColor Gray = new BgColor._internal('bg-gray');

  static final List<BgColor> values = [
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
  TextColor._internal(String className) : super(className);

  static final TextColor White = new TextColor._internal('text-white');
  static final TextColor Black = new TextColor._internal('text-black');
  static final TextColor Primary = new TextColor._internal('text-primary');
  static final TextColor Alternate = new TextColor._internal('text-alt');
  static final TextColor Success = new TextColor._internal('text-success');
  static final TextColor Warn = new TextColor._internal('text-warn');
  static final TextColor Danger = new TextColor._internal('text-danger');
  static final TextColor Gray = new TextColor._internal('text-gray');

  static final List<TextColor> values = [
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
