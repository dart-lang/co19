// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<File> writeAsBytes(
/// List<int> bytes, {
/// FileMode mode: FileMode.write,
/// bool flush: false
/// })
/// Write a list of bytes to a file.
///
/// Opens the file, writes the list of bytes to it, and closes the file. Returns
/// a Future<File> that completes with this File object once the entire operation
/// has completed.
///
/// By default writeAsBytes creates the file for writing and truncates the file
/// if it already exists. In order to append the bytes to an existing file, pass
/// FileMode.append as the optional mode parameter.
///
/// If the argument flush is set to true, the data written will be flushed to the
/// file system before the returned future completes.
/// @description Checks that in a FileMode.writeOnly file can be read
/// @author sgrekhov@unipro.ru
/// @issue 30262

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  File file = new File(getTempFilePath(parent: sandbox));
  file.writeAsBytesSync([3, 1, 4, 5, 2, 6]);
  asyncStart();
  await file.writeAsBytes([0, 1, 2, 255], mode: FileMode.writeOnly).then((f) {
    Expect.isTrue(file.existsSync());
    Expect.listEquals([0, 1, 2, 255], f.readAsBytesSync());
    Expect.listEquals([0, 1, 2, 255], file.readAsBytesSync());
    asyncEnd();
  });
}
