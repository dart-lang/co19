/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> open({FileMode mode: FileMode.READ})
 * Open the file for random access operations. Returns a
 * Future<RandomAccessFile> that completes with the opened random access file.
 * RandomAccessFiles must be closed using the RandomAccessFile.close method.
 *
 * Files can be opened in three modes:
 * FileMode.READ: open the file for reading.
 * FileMode.WRITE: open the file for both reading and writing and truncate the
 * file to length zero. If the file does not exist the file is created.
 *
 * FileMode.APPEND: same as FileMode.WRITE except that the file is not
 * truncated.
 * @description Checks that this method returns a Future<RandomAccessFile> that
 * completes with the opened random access file. Test READ mode
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  file.open(mode: FileMode.READ).then((RandomAccessFile raFile) {
    try {
      Expect.isNotNull(raFile);
      Expect.throws(() {raFile.writeByteSync(1);});
      asyncEnd();
    } finally {
      raFile.closeSync();
      file.delete();
    }
  });
}
