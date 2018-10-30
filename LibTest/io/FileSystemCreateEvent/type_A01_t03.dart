/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int type
 *  final
 * The type of event. See FileSystemEvent for a list of events.
 * @description Checks that this property returns type of event. Test Link
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: sandbox);
  asyncStart();
  StreamSubscription s = null;
  s = dir.watch().listen((FileSystemEvent event) {
    s.cancel().then((_) {
      sandbox.delete(recursive: true);
    }).then((_) {
      Expect.equals(FileSystemEvent.create, event.type);
      asyncEnd();
    });
  });
  getTempLinkSync(parent: dir, target: target.path);
}
