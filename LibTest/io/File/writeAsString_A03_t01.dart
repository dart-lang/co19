// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<File> writeAsString(
///  String contents, {
///  FileMode mode: FileMode.write,
///  Encoding encoding: utf8,
///  bool flush: false
///  })
/// Write a string to a file.
///
/// Opens the file, writes the string in the given encoding, and closes the file.
/// Returns a Future<File> that completes with this File object once the entire
/// operation has completed.
///
/// By default writeAsString creates the file for writing and truncates the file
/// if it already exists. In order to append the bytes to an existing file, pass
/// FileMode.append as the optional mode parameter.
///
/// If the argument flush is set to true, the data written will be flushed to the
/// file system before the returned future completes.
/// @description Checks that by default writeAsString creates the file for
/// writing
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  File file = new File(getTempFilePath(parent: sandbox));
  asyncStart();
  String toWrite = "File content";
  await file.writeAsString(toWrite).then((f) {
    Expect.isTrue(file.existsSync());
    asyncEnd();
  });
}
