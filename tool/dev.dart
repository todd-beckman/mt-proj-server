library tool.dev;

import 'package:dart_dev/dart_dev.dart' show dev, config;

main(List<String> args) async {
  // https://github.com/Workiva/dart_dev

  // Perform task configuration here as necessary.

  // Available task configurations:
  // config.analyze
  // config.copyLicense
  // config.coverage
  // config.docs
  // config.example
  config.format
    ..directories = ['example', 'lib', 'web', 'tool']
    ..exclude = ['lib/mt_api'];
  // config.test

  await dev(args);
}
