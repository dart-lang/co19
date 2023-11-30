// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<List<int>> readAsBytes()
/// Read the entire file contents as a list of bytes. Returns a Future<List<int>>
/// that completes with the list of bytes that is the contents of the file.
/// @description Checks that future completes with a FileSystemException if the
/// operation fails
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  File file = new File(getTempFilePath(parent: sandbox));
  file.writeAsBytesSync([1, 2, 3]);
  file.deleteSync();
  asyncStart();
  await file.readAsBytes().then((data) {
    Expect.fail("FileSystemException expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}
