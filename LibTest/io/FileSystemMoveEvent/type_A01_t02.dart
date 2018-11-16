/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int type
 *  final
 * The type of event. See FileSystemEvent for a list of events.
 * @description Checks that this property returns type of event. Test Directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory d = getTempDirectorySync(parent: dir);
  asyncStart();
  await testFileSystemEvent<FileSystemMoveEvent>(dir,
      createEvent: () {
        d.renameSync(getTempDirectoryPath(parent: dir));
      }, test: (FileSystemEvent event) {
        Expect.equals(FileSystemEvent.move, event.type);
      }, failIfNoEvent: false);
  asyncEnd();
}
