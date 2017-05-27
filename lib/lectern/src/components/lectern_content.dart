import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/common_ui/flexbox.dart';
import 'package:mtproj/lectern/src/api.dart';
import 'package:mtproj/lectern/src/store.dart';

/// The "Homepage" of MT.
///
/// Its contents will likely differ drastically for ease of development.
@Factory()
UiFactory<LecternProps> Lectern;

@Props()
class LecternProps extends FluxUiProps<LecternActions, LecternStore> {}

@Component()
class LecternComponent extends FluxUiComponent<LecternProps> {
  @override
  ReactElement render() => (Dom.div()..className = 'lt-body')(
        (Container()..className = 'lt-content__wrapper')(
          (Block()..className = 'lt-body-wrapper ft-body')(
              //props.store.fileTreeContent,
              ),
          (Block()..className = 'lt-body-wrapper et-body')(
//            props.store.editorContent,
              ),
        ),
      );
}
