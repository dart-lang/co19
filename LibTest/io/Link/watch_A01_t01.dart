// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<FileSystemEvent> watch({
///  int events: FileSystemEvent.ALL,
///  bool recursive: false
///  })
/// Start watching the FileSystemEntity for changes.
///
/// @description Checks that this method watches the FileSystemEntity for
/// changes.
///
/// @note The test should run with the Administrator priveleges on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD set as
/// the errno when this call is made.
///
/// @author sgrekhov@unipro.ru
/// @issue 30918

import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(target: target.path, parent: sandbox);

  final eventCompleter = new Completer<FileSystemEvent>();
  asyncStart();
  StreamSubscription s = link.watch().listen((FileSystemEvent event) {
    Expect.equals(FileSystemEvent.create, event.type);
    eventCompleter.complete(event);
    asyncEnd();
  });
  target.createTempSync();

  await eventCompleter.future
    .then((FileSystemEvent fse) async {
      await s.cancel();
      return eventCompleter.future;
  }).timeout(Duration(seconds: eventsTimeout), onTimeout: () async {
    await s.cancel();
    return eventCompleter.future;
  });
}
