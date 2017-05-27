import 'dart:async';

import 'package:mtproj/mt_api.dart' as api;

import 'package:mtproj/core/core.dart' show Messenger;

/// A static class containing global information
class CentralIntelligence {
  CentralIntelligence(Messenger this._messenger);

  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  Messenger _messenger;

  Map<String, api.Project> get projectMap => _projectMap;
  Map<String, api.Project> _projectMap;

  Future loadProjectMeta() async {
    try {
      _projectMap = await _messenger.getProjectListForUser();
    } catch (e) {
      print(e);
      return;
    }

    _isLoaded = true;
  }
}
