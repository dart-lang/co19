/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory parent
 * The directory containing this.
 * @description Checks that this property returns the directory containing this.
 * Test absolute path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory tmp = sandbox;
  Directory child = getTempDirectorySync(parent: tmp);
  Directory dir = new Directory(child.path);
  Expect.equals(tmp.path, dir.parent.path);

  String notExisting =
      tmp.path + Platform.pathSeparator + getTempDirectoryName();
  dir = new Directory(notExisting);
  Expect.equals(tmp.path, dir.parent.path);
}
