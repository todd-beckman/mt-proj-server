import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';

@Factory()
UiFactory<ResizeBarProps> ResizeBar;

@Props()
class ResizeBarProps extends UiProps {
  bool hookRight;
}

@Component()
class ResizeBarComponents extends UiComponent<ResizeBarProps> {
  @override
  ResizeBarProps getDefaultProps() => newProps()..hookRight = false;

  @override
  ReactElement render() {
    var childProps = copyUnconsumedProps();
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(childProps)
      ..add('rb-hitarea')
      ..add(
          props.hookRight ? 'rb-hitarea__hook-right' : 'rb-hitarea__hook-left');
    return (Dom.div()
      ..className = classNameBuilder.toClassName()
      ..addProps(childProps))();
  }
}
