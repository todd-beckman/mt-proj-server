import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/mt_skin/flexbox.dart';
import 'package:mtproj/mt_skin/mt_skin.dart';
import 'package:mtproj/editor/src/api.dart';
import 'package:mtproj/editor/src/store.dart';

import 'doc_editor.dart';

@Factory()
UiFactory<EditorProps> Editor;

@Props()
class EditorProps extends FluxUiProps<EditorActions, EditorStore> {
  TextColor color;
}

@Component()
class EditorComponent extends FluxUiComponent<EditorProps> {
  @override
  void componentDidMount() {
    props.actions.loadDocument();
    super.componentWillMount();
  }

  @override
  ReactElement render() {
    if (!props.store.isLoaded) {
      return (Block()..className = 'et-body et-body--loading')(
        Dom.p()('Loading...'),
      );
    }
    return (Block()..className = 'et-body')(
      _renderBody(),
    );
  }

  ReactElement _renderBody() {
    if (props.store.docs.length == 0) {
      return Dom.p()('No documents are loaded...');
    }
    var documents = [];
    props.store.docs.forEach((String docId, String content) {
      documents.add((Doc()
        ..actions = props.actions
        ..className = 'et-body__document'
        ..color = props.color
        ..content = content
        ..docId = docId
        ..key = docId)());
    });
    return Dom.div()(
      documents,
    );
  }
}
