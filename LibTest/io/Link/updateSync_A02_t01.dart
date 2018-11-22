/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void updateSync(String target)
 * Synchronously updates the link. Calling updateSync on a non-existing link
 * will throw an exception.
 *
 * On the Windows platform, this will only work with directories, and the target
 * directory must exist.
 * @description Check that calling updateSync on a non-existing link will throw
 * an exception.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory newTarget = getTempDirectorySync(parent: sandbox);
  Link link = new Link(getTempFilePath(parent: sandbox));
  bool thrown = false;
  try {
    link.updateSync(newTarget.path);
    Expect.fail("FileSystemException expected");
  } on FileSystemException {
    thrown = true;
  } finally {
    Expect.isTrue(thrown);
  }
}
