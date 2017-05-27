import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

@Factory()
UiFactory<TallToolbarProps> TallToolbar;

@Props()
class TallToolbarProps extends UiProps {
  bool isRightSide;
}

@Component()
class TallToolbarComponent extends UiComponent<TallToolbarProps> {
  @override
  TallToolbarProps getDefaultProps() => newProps()..isRightSide = false;

  @override
  ReactElement render() {
    var classNameBuilder = new ClassNameBuilder()
      ..add('ttb')
      ..add('ttb__right', props.isRightSide)
      ..add('ttb__left', !props.isRightSide);
    return (Dom.div()..className = classNameBuilder.toClassName())(
      '=D',
    );
  }
}
