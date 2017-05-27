import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/mt_skin/flexbox.dart';
import 'package:mtproj/file_tree/src/api.dart';
import 'package:mtproj/file_tree/src/store.dart';

import 'file_node.dart';

@Factory()
UiFactory<FileTreeProps> FileTree;

@Props()
class FileTreeProps extends FluxUiProps<FileTreeActions, FileTreeStore> {}

@Component()
class FileTreeComponent extends FluxUiComponent<FileTreeProps> {
  @override
  ReactElement render() {
    ReactElement body;
    if (props.store.isLoaded) {
      body = (FileNode() /*..file = props.store.root*/)();
    } else {
      body = Dom.p()('Loading...');
    }

    return (Container()..vertical = true)(
      body,
    );
  }
}
