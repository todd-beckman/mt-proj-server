import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';

import 'package:mtproj/mt_skin/mt_skin.dart';

const _buttonPrefix = 'mt-button';

class ButtonSkin extends MTSkinConstant {
  const ButtonSkin._internal(String className) : super(className);

  static const Primary = const ButtonSkin._internal('${_buttonPrefix}-primary');
  static const Alternate = const ButtonSkin._internal('${_buttonPrefix}-alt');
  static const Success = const ButtonSkin._internal('${_buttonPrefix}-success');
  static const Warn = const ButtonSkin._internal('${_buttonPrefix}-warn');
  static const Danger = const ButtonSkin._internal('${_buttonPrefix}-danger');
  static const Gray = const ButtonSkin._internal('${_buttonPrefix}-gray');
}

@Factory()
UiFactory<ButtonProps> Button;

@Props()
class ButtonProps extends UiProps {
  // TODO required props
  ButtonSkin skin;
}

@Component()
class ButtonComponents extends UiComponent<ButtonProps> {
  @override
  ButtonProps getDefaultProps() => newProps()..skin = ButtonSkin.Gray;

  @override
  ReactElement render() {
    return (Dom.input()
      ..value = props.children
      ..type = 'button'
      ..className = (forwardingClassNameBuilder()
            ..add(_buttonPrefix)
            ..add(props.skin.className))
          .toClassName()
      ..addProps(copyUnconsumedProps()))();
  }
}
