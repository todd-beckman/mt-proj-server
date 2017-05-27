import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import '../region_manager.dart';

import 'package:mtproj/mt_skin/mt_skin.dart';

@Factory()
UiFactory<RegionTemplateProps> RegionTemplate;

@Props()
class RegionTemplateProps extends FluxUiProps<RegionActions, RegionManager> {
  RegionLocation location;
}

@Component()
class RegionTemplateComponent extends FluxUiComponent<RegionTemplateProps> {
  String baseClassName;

  @override
  void componentWillMount() {
    super.componentWillMount();

    baseClassName = classNameForLocation(props.location);
  }

  @override
  ReactElement render() {
    var childProps = copyUnconsumedProps();
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(childProps)
      ..add('$baseClassName-content');

    return (Dom.div()..className = classNameBuilder.toClassName())(
      props.store.activeContent.content,
    );
  }
}
