/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Directory> createTemp([String prefix])
 * Creates a temporary directory in this directory. Additional random characters
 * are appended to prefix to produce a unique directory name. If prefix is
 * missing or null, the empty string is used for prefix.
 *
 * Returns a Future<Directory> that completes with the newly created temporary
 * directory.
 * @description Checks that this method creates a temporary directory in this
 * directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  asyncStart();
  Directory parent = getTempDirectorySync(parent: sandbox);
  await parent.createTemp().then((dir) {
    Expect.equals(parent.path, dir.parent.path);
    Expect.isTrue(dir.existsSync());
    asyncEnd();
  });
}
