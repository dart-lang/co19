/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int mode
 * final
 *
 * The mode of the file system object. Permissions are encoded in the lower 16
 * bits of this number, and can be decoded using the modeString getter.
 * @description Checks that this property returns the mode of the file system
 * object
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
  if (Platform.isWindows) {
    Expect.equals(33206, fs.mode);
  } else {
    List<int> okValues = [
      33152, 33154, 33156, 33158, 33168, 33170, 33172, 33174, 33184, 33186,
      33188, 33190, 33200, 33202, 33204, 33206
    ];
    Expect.isTrue(okValues.contains(fs.mode));
  }
}
