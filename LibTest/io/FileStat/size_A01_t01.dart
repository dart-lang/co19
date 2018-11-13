/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int size
 *  final
 * The size of the file system object.
 * @description Checks that this property returns the size of the file system
 * object.
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
  FileStat fs = FileStat.statSync(file.path);
  Expect.equals(0, fs.size);

  file.writeAsBytesSync([0, 1, 2]);
  fs = FileStat.statSync(file.path);
  Expect.equals(3, fs.size);
}
