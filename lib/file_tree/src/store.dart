import 'dart:async';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:mtproj/mt_api.dart' as api;
import 'package:w_flux/w_flux.dart';
import 'package:w_module/w_module.dart';
import 'package:mtproj/central_intelligence/central_intelligence.dart';

import 'package:mtproj/core/core.dart';

import 'api.dart';
import 'events.dart';

class FileTreeStore extends Store {
  FileTreeStore({
    @required AppContext this.appContext,
    @required FileTreeActions actions,
    @required DispatchKey dispatchKey,
    @required FileTreeEvents events,
    @required String this.projectId,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    didDispose.then((_) {
      _actions = null;
      _events = null;
    });
  }

  final AppContext appContext;
  final String projectId;

  FileTreeActions _actions;
  FileTreeEvents _events;
  DispatchKey _dispatchKey;
  Logger _log = new Logger('mtproj.filetree');
  MtProject _project;

  /// Whether the calls from the server have returned with data that can be rendered for the user.
  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  MtProject get project => _project;

  String get title {
    if (_project == null) {
      return 'Outline';
    }
    return _project.displayName ?? 'Outline';
  }

  Future<Null> load() async {
    if (appContext.intel.project == null) {
      try {
        await appContext.intel.loadProjectMeta(projectId);
      } catch (e) {
        _log.severe('Cannot load project meta for $projectId');
        return;
      }

      if (appContext.intel.project == null) {
        _log.severe('Project meta is null even after attempting to fetch it');
        return;
      }
    }

    _project = appContext.intel.project;

    _isLoaded = true;
    trigger();
  }
}
