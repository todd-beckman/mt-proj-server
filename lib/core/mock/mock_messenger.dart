import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mtproj/mt_api.dart' as api;

import '../src/messenger.dart';
import '../src/environment.dart';
import '../src/session.dart';

class MockMessenger extends Messenger {
  MockMessenger({
    @required Environment environment,
    @required Session session,
  })
      : super(
          environment: environment,
          session: session,
        ) {}

  @override
  Future<Null> load() async {}

  @override
  Future<api.Project> getProjectMeta(String projectId) async {
    return new api.Project()
      ..id = 'some-id'
      ..displayName = 'Some project';
  }

  @override
  Future<Map<String, api.Project>> getProjectListForUser() async {
    Map<String, api.Project> map = {};

    var id = 0;
    [
      new api.Project()
        ..id = '${id}'
        ..displayName = 'Project ${id++}',
      new api.Project()
        ..id = '${id}'
        ..displayName = 'Project ${id++}',
      new api.Project()
        ..id = '${id}'
        ..displayName = 'Project ${id++}',
      new api.Project()
        ..id = '${id}'
        ..displayName= 'Project ${id++}',
    ].forEach((api.Project project) => map[project.id] = project);

    return map;
  }

  @override
  Future<api.FileMeta> getFileTree(String projectId) async {
    var root = new api.FileMeta()
      ..id = 'root'
      ..displayName = 'root'
      ..children = [];

    for (var i = 1; i <= 5; i++) {
      var part = new api.FileMeta()
        ..id = 'p$i'
        ..displayName = 'Part $i'
        ..children = [];

      for (var j = 1; j <= 10; j++) {
        var chapter = new api.FileMeta()
          ..id = 'p$i c$j'
          ..displayName = 'Chapter $j'
          ..children = [];

        for (var k = 1; k <= 3; k++) {
          chapter.children.add(new api.FileMeta()
            ..id = 'p$i c$j s$k'
            ..displayName = 'Scene $i'
            ..children = []);
        }
        part.children.add(chapter);
      }
      root.children.add(part);
    }
    return root;
  }

  @override
  Future<String> getFileContent(String fileId) async {
    var phrase =
        'A wood chuck would chuck all the wood it could chuck if a wood chuck could chuck wood. ';
    return phrase * 30;
  }
}
