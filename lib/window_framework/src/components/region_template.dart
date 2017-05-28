import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import '../region_manager.dart';

@Factory()
UiFactory<RegionTemplateProps> RegionTemplate;

@Props()
class RegionTemplateProps extends FluxUiProps<RegionActions, RegionManager> {
  RegionLocation location;

  // Declare these explicitly because otherwise they get copied into copyUnconsumedProps
  RegionActions actions;
  RegionManager store;
}

@Component()
class RegionTemplateComponent extends FluxUiComponent<RegionTemplateProps> {
  String baseClassName;

  @override
  void componentWillMount() {
    super.componentWillMount();

    baseClassName = props.location.className;
  }

  @override
  ReactElement render() {
    var children = <ReactElement>[];
    var component = props.store.activeProduct;
    if (component != null) {
      var title = component.title;
      if (title != null) {
        children.add((Dom.div()
          ..className = 'main-region-title'
          ..key = 'title')(
          (Dom.div()..className = 'main-region-title__text')(
            title,
          ),
        ));
      }

      var content = component.content;
      if (content != null) {
        children.add((Dom.div()
          ..className = 'main-region__content'
          ..key = 'content')(
          content,
        ));
      }
    }

    return (Dom.div()
      ..className = forwardingClassNameBuilder().toClassName()
      ..addProps(copyUnconsumedProps()))(
      children,
    );
  }
}
