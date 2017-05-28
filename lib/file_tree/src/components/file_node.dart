import 'package:mtproj/central_intelligence/central_intelligence.dart';
import 'package:mtproj/mt_skin/flexbox.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import '../store.dart';

const NAME_PADDING = 10;

@Factory()
UiFactory<FileNodeProps> FileNode;

@Props()
class FileNodeProps extends UiProps {
  int _depth;
  MtFile file;
  FileTreeStore store;
}

@State()
class FileNodeState extends UiState {
  bool active;
  bool collapsed;
}

@Component()
class FileNodeComponent
    extends UiStatefulComponent<FileNodeProps, FileNodeState> {
  @override
  FileNodeState getInitialState() => newState()
    ..active = false
    ..collapsed = false;

  @override
  FileNodeProps getDefaultProps() => newProps().._depth = 0;

  @override
  ReactElement render() {
    var fileNameClassBuilder = new ClassNameBuilder()
      ..add('ft-file__name')
      ..add('active', state.active);
    var items = <ReactElement>[
      (Block()
        ..key = 'name'
        ..className = fileNameClassBuilder.toClassName()
        ..onClick = _handleClick)(
        _padName(props.file.displayName, props._depth),
      ),
    ];

    if (!state.collapsed) {
      items.add(
        (Container()
          ..key = 'list'
          ..vertical = true
          ..className = 'ft-file-list__container')(
          _renderFileList(props.file, props._depth),
        ),
      );
    }

    return (Block()..className = 'ft-file')(
      items,
    );
  }

  List<ReactElement> _renderFileList(MtFile file, int depth) {
    var items = <ReactElement>[];

    file.children.forEach((String fileId) {
      var file = props.store.project[fileId];
      if (file != null) {
        items.add(
          (Block()
            ..key = file.id
            ..className = 'ft-list__file')(
            (FileNode()
              .._depth = props._depth + 1
              ..file = file
              ..store = props.store
            )(),
          ),
        );
      }
    });
    return items;
  }

  ReactElement _padName(String name, int depth) =>
      (Dom.span()..className = 'ft-file-name__content')(
        (Dom.span()..className = 'ft-file-name__padding')(
          ' | ' * depth,
        ),
        (Dom.span()..className = 'ft-file-name__expand-icon')(
          _renderExpandedState(),
        ),
        name,
      );

  _renderExpandedState() {
    if (props.file.children?.length == 0) {
      return '';
    }
    if (state.collapsed == true) {
      return '> ';
    }
    return 'v ';
  }

  _handleClick(e) {}

  _handleExpandOrCollapse(e) {
    setState(newState()..collapsed = !state.collapsed);
  }
}
