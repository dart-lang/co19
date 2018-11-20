/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory renameSync(String newPath)
 * Synchronously renames this directory. Returns a Directory instance for the
 * renamed directory.
 *
 * If newPath identifies an existing directory, that directory is replaced. If
 * newPath identifies an existing file the operation fails and an exception is
 * thrown.
 * @description Checks that this method synchronously renames this directory and
 * returns a Directory instance for the renamed directory.
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
  Directory renamed = dir.renameSync(getTempDirectoryPath(parent: sandbox));
  Expect.isTrue(renamed.existsSync());
  Expect.isFalse(dir.existsSync());
}
