import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mtproj/mt_api.dart' as api;
import 'package:mtproj/core/core.dart' show Messenger;

import 'mt_project.dart';

Logger _log = new Logger('mtproj.intel');

/// The class that contains the data that has been fetched from the server.
class CentralIntelligence {
  CentralIntelligence(Messenger this._messenger);


  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  Messenger _messenger;

  /// The currently-active project
  MtProject get project => _project;
  MtProject _project;

  Future loadProjectMeta(String projectId) async {
    api.Project project;
    try {
      project = await _messenger.getProjectMeta(projectId);
    } catch (e) {
      _log.severe(e);
      throw e;
    }

    _project = new MtProject(project, _messenger);
    try {
      await _project.loadFileTree();
    } catch (e) {
      _log.severe(e);
      throw e;
    }
    _isLoaded = true;
  }
}
