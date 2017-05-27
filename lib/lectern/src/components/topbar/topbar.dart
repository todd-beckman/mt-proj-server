import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/mt_skin/flexbox.dart';
import 'package:mtproj/lectern/src/api.dart';

@Factory()
UiFactory<TopBarProps> TopBar;

@Props()
class TopBarProps extends UiProps {
  LecternActions actions;
}

@Component()
class TopBarComponent extends UiComponent<TopBarProps> {
  @override
  ReactElement render() {
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(props)
      ..add('lt-top-bar');
    return (Container()..className = classNameBuilder.toClassName())(
      props.children,
    );
  }
}
