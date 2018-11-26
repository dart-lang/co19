/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> open({FileMode mode: FileMode.read})
 * Open the file for random access operations. Returns a
 * Future<RandomAccessFile> that completes with the opened random access file.
 * RandomAccessFiles must be closed using the RandomAccessFile.close method.
 *
 * Files can be opened in three modes:
 * FileMode.read: open the file for reading.
 * FileMode.write: open the file for both reading and writing and truncate the
 * file to length zero. If the file does not exist the file is created.
 *
 * FileMode.append: same as FileMode.write except that the file is not
 * truncated.
 * @description Checks that if file path is wrong then this operation fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../file_utils.dart";
import "../../../Utils/expect.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File f = getTempFileSync(parent: sandbox);
  String path = "!" + f.absolute.path; // wrong file path
  File file = new File(path);

  asyncStart();
  await file.open(mode: FileMode.read).then((RandomAccessFile raf) {
    raf.closeSync();
    Expect.fail("Error expected");
  }, onError: (_) {
    asyncEnd();
  });
}
