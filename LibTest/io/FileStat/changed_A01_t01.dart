/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime changed
 * final
 * The time of the last change to the data or metadata of the file system
 * object. On Windows platforms, this is instead the file creation time.
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
  asyncStart();
  await FileStat.stat(file.path).then((FileStat fs) async {
    DateTime changed1 = fs.changed;
    await file.writeAsBytes([1, 2, 3]).then((_) {
      FileStat fs2 = FileStat.statSync(file.path);
      if (Platform.isWindows) {
        Expect.equals(changed1, fs2.changed);
      } else {
        Expect.isTrue(changed1.microsecond < fs2.changed.microsecond);
      }
      asyncEnd();
    });
  });
}
