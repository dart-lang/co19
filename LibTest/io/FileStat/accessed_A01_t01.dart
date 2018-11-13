/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime accessed
 * final
 * The time of the last access to the data of the file system object. On Windows
 * platforms, this may have 1 day granularity, and be out of date by an hour.
 * @description Checks that this property returns the time of the last access to
 * the data of the file system object
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
    Expect.isTrue(fs.accessed.difference(new DateTime.now()).inDays <= 1);
  } else {
    Expect.isTrue(fs.accessed.difference(new DateTime.now()).inSeconds <= 5);
  }
}
