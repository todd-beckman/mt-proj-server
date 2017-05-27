import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';

import 'package:mtproj/mt_skin/mt_skin.dart';

const _buttonPrefix = 'mt-button';

class ButtonSkin extends MTSkinConstant {
  ButtonSkin._internal(String className) : super(className);

  static final Primary = new ButtonSkin._internal('${_buttonPrefix}-primary');
  static final Alternate = new ButtonSkin._internal('${_buttonPrefix}-alt');
  static final Success = new ButtonSkin._internal('${_buttonPrefix}-success');
  static final Warn = new ButtonSkin._internal('${_buttonPrefix}-warn');
  static final Danger = new ButtonSkin._internal('${_buttonPrefix}-danger');
  static final Gray = new ButtonSkin._internal('${_buttonPrefix}-gray');
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
