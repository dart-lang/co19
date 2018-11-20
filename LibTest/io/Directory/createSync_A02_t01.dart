/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void createSync({bool recursive: false})
 * Synchronously creates the directory with this name.
 *
 * If recursive is false, only the last directory in the path is created. If
 * recursive is true, all non-existing path components are created. If the
 * directory already exists nothing is done.
 *
 * If the directory cannot be created an exception is thrown.
 * @description Checks that if the directory already exists nothing is done.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory tmp = getTempDirectorySync(parent: sandbox);
  Directory dir = new Directory(tmp.path + Platform.pathSeparator + "TestDir");
  dir.createSync();
  Expect.isTrue(dir.existsSync());

  dir.createSync();
  Expect.isTrue(dir.existsSync());
}
