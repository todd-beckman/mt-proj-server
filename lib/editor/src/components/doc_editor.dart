import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/common_ui/flexbox.dart';
import 'package:mtproj/common_ui/mt_skin.dart';
import 'package:mtproj/editor/src/api.dart';

@Factory()
UiFactory<DocProps> Doc;

@Props()
class DocProps extends UiProps {
  MTColor color;
  EditorActions actions;
  String docId;
  String content;
}

@Component()
class DocComponent extends UiComponent<DocProps> {
  @override
  void componentDidMount() {
    props.actions.loadDocument();
    super.componentWillMount();
  }

  @override
  ReactElement render() {
    return (Block()..className = 'et-body-doc')(
      _renderHeader(),
      _renderForm(),
      _renderBody(),
    );
  }

  ReactElement _renderHeader() => (Dom.h1()..className = 'et-body-doc__header')(
        props.docId,
      );

  ReactElement _renderForm() => (Dom.form())(
        (Dom.button()
          ..className = 'et-body-doc__load-button'
          ..onClick = (_) => props.actions.loadDocument(props.docId))(
          'Load Document',
        ),
        (Dom.button()
          ..className = 'et-body-doc__post-button'
          ..onClick = (_) => props.actions.saveDocument(props.docId))(
          'Send Document',
        ),
      );

  ReactElement _renderBody() => (Dom.input()
    ..key = props.docId
    ..type = 'text'
    ..target = 'input'
    ..value = props.content
    ..onChange = _handleInputChanged
    ..className = 'et-body-doc__editor')();

  _handleInputChanged(e) {}
}
