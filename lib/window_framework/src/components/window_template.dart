import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/ui_components/ui_components.dart';

import 'region_template.dart';
import '../region_manager.dart';

@Factory()
UiFactory<WindowTemplateProps> WindowTemplate;

@Props()
class WindowTemplateProps extends UiProps {
  // TODO: required annotations for props
  RegionManager head;
  RegionManager left;
  RegionManager body;
  RegionManager right;
  RegionManager foot;
}

@Component()
class WindowTemplateComponent extends UiComponent<WindowTemplateProps> {
  /// Left panel width in px
  int leftWidth;

  /// Right panel width in px
  int rightWidth;

  @override
  void componentWillMount() {
    super.componentWillMount();

    leftWidth = 300; // TODO: smart default to device size
    rightWidth = 300; // TODO: smart default to device size
  }

  @override
  ReactElement render() {
    var childProps = copyUnconsumedProps();
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(childProps)
      ..add('main');

    var children = <ReactElement>[];
    if (props.head.shouldRenderRegion) {
      children.add(_renderHeadPanel());
    }
    if (props.left.shouldRenderRegion) {
      children.add(_renderLeftPanel());
    }
    if (props.right.shouldRenderRegion) {
      children.add(_renderRightPanel());
    }
    if (props.body.shouldRenderRegion) {
      children.add(_renderBody());
    }

    return (Dom.div()..className = classNameBuilder.toClassName())(
      children,
    );
  }

  ReactElement _renderHeadPanel() {
    return (RegionTemplate()
      ..actions = props.head.actions
      ..className = 'main-head'
      ..key = 'head'
      ..location = RegionLocation.Head
      ..store = props.head)();
  }

  ReactElement _renderLeftPanel() {
    return (RegionTemplate()
      ..actions = props.left.actions
      ..className = 'main-region main-left'
      ..key = 'left'
      ..location = RegionLocation.Left
      ..store = props.left
      ..style = {
        'width': '${leftWidth}px',
      })();
  }

  ReactElement _renderRightPanel() {
    return (RegionTemplate()
      ..actions = props.right.actions
      ..className = 'main-region main-right'
      ..key = 'right'
      ..location = RegionLocation.Right
      ..store = props.right
      ..style = {
        'width': '${rightWidth}px',
      })();
  }

  ReactElement _renderBody() {
    var left = props.left.shouldRenderRegion ? leftWidth : 0;
    var right = props.right.shouldRenderRegion ? rightWidth : 0;
    return (RegionTemplate()
      ..actions = props.body.actions
      ..className = 'main-region main-body'
      ..key = 'body'
      ..location = RegionLocation.Body
      ..store = props.body
      ..style = {
        'left': '${left}px',
        'right': '${right}px',
      })();
  }
}
