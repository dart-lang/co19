/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion File renameSync(String newPath)
 * Synchronously renames this file. Returns a File instance for the renamed
 * file.
 *
 * If newPath identifies an existing file, that file is replaced. If newPath
 * identifies an existing directory the operation fails and an exception is
 * thrown.
 * @description Checks that if newPath identifies an existing file, that file is
 * replaced
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  File target = getTempFileSync(parent: sandbox);
  file.writeAsStringSync("Source");
  target.writeAsStringSync("Target");

  File renamed = file.renameSync(target.path);
  Expect.equals(target.path, renamed.path);
  Expect.isTrue(renamed.existsSync());
  Expect.equals("Source", renamed.readAsStringSync());
  Expect.isFalse(file.existsSync());
}
