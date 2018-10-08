/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RandomAccessFile openSync({FileMode mode: FileMode.read})
 * Synchronously open the file for random access operations. The result is a
 * RandomAccessFile on which random access operations can be performed. Opened
 * RandomAccessFiles must be closed using the RandomAccessFile.close method.
 *
 * See open for information on the mode argument.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method synchronously open the file for random
 * access operations. Test that RandomAccessFile can be randomly accessed
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsBytesSync([0, 1, 2, 3, 4]);
  RandomAccessFile raFile = file.openSync(mode: FileMode.read);
  try {
    Expect.isNotNull(raFile);
    raFile.setPositionSync(1);
    Expect.listEquals([1, 2], raFile.readSync(2));
  } finally {
    raFile.closeSync();
    file.delete();
  }
}
