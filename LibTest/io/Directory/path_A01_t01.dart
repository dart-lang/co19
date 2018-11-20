/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 *  final
 * Gets the path of this directory.
 * @description Checks that this property returns the path of this directory.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  String dirName = getTempDirectoryName();
  Directory dir = new Directory(dirName);
  Expect.equals(dirName, dir.path);

  Directory tmp = sandbox;
  dir = new Directory(tmp.path);
  Expect.equals(tmp.path, dir.path);
}
