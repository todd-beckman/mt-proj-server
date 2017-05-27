import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/mt_skin/flexbox.dart';

@Factory()
UiFactory<TopBarItemProps> TopBarItem;

@Props()
class TopBarItemProps extends UiProps {}

@Component()
class TopBarItemComponent extends UiComponent<TopBarItemProps> {
  @override
  ReactElement render() {
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(props)
      ..add('lt-top-bar__item');
    return (Block()..className = classNameBuilder.toClassName())(
      (Dom.button()
        ..className = 'lt-top-bar__button'
        ..onClick = props.onClick)(
        props.children,
      ),
    );
  }
}
