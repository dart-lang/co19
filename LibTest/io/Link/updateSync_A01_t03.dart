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
 * @description Check that this method synchronously updates the link. Test
 * link as a target
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory target1 = getTempDirectorySync();
  Directory target2 = getTempDirectorySync();
  Link link = getTempLinkSync(target: target1.path);
  Link newTarget = getTempLinkSync(target: target2.path);
  try {
    link.updateSync(newTarget.path);
    Expect.equals(newTarget.path, link.targetSync());
  } finally {
    link.delete();
    newTarget.delete();
    target1.delete();
    target2.delete();
  }
}
