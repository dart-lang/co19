/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Directory> create({bool recursive: false})
 * Creates the directory with this name.
 *
 * If recursive is false, only the last directory in the path is created. If
 * recursive is true, all non-existing path components are created. If the
 * directory already exists nothing is done.
 *
 * Returns a Future<Directory> that completes with this directory once it has
 * been created. If the directory cannot be created the future completes with an
 * exception.
 * @description Checks that if recursive is true, all non-existing path
 * components are created
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
  Directory tmp = new Directory(getTempDirectoryPath(parent: sandbox));
  Directory dir = new Directory(getTempDirectoryPath(parent: tmp));
  await dir.create(recursive: true).then((created) {
    Expect.isTrue(created.existsSync());
    asyncEnd();
  });
}
