/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime modified
 *  final
 * The time of the last change to the data of the file system object.
 * @description Checks that this property returns the time of the last access to
 * the data of the file system object
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
    FileStat.stat(file.path).then((FileStat fs) {
      DateTime modified1 = fs.modified;
      file.writeAsBytes([1, 2, 3]).timeout(new Duration(seconds: 2)).then((_) {
        try {
          FileStat fs2 = FileStat.statSync(file.path);
          if (Platform.isWindows) {
            Expect.equals(modified1, fs2.modified);
          } else {
            Expect.isTrue(modified1.microsecond < fs2.modified.microsecond);
          }
          asyncEnd();
        } finally {
          file.delete();
        }
      });
    });
}
