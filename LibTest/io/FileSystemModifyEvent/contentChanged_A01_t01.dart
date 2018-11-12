/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contentChanged
 *  final
 * If the content was changed and not only the attributes, contentChanged is
 * true.
 * @description Checks that this property returns false if the content was not
 * changed
 * @issue 35112
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
  File f = getTempFileSync(parent: dir);
  asyncStart();
  await testFileSystemEvent<FileSystemModifyEvent>(dir,
      createEvent: () {
        f.setLastAccessedSync(new DateTime.now());
      }, test: (FileSystemEvent event) {
        Expect.isFalse((event as FileSystemModifyEvent).contentChanged);
      });
  asyncEnd();
}
