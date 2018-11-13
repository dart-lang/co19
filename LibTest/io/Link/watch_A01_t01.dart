/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<FileSystemEvent> watch({
 *  int events: FileSystemEvent.ALL,
 *  bool recursive: false
 *  })
 * Start watching the FileSystemEntity for changes.
 * @description Checks that this method watches the FileSystemEntity for
 * changes.
 * @author sgrekhov@unipro.ru
 * @issue 30918
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory target1 = getTempDirectorySync(parent: sandbox);
  Directory target2 = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(target: target1.path, parent: sandbox);

  final eventCompleter = new Completer<FileSystemEvent>();
  StreamSubscription s;
  asyncStart();
  s = link.watch().listen((FileSystemEvent event) {
    Expect.equals(FileSystemEvent.modify, event.type);
    asyncEnd();
  });
  link.updateSync(target2.path);

  await eventCompleter.future
      .timeout(Duration(seconds: eventsTimeout), onTimeout: () async {
    await s.cancel();
  });
}
