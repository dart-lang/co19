// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion FileStat statSync()
/// Synchronously calls the operating system's stat() function on the path of
/// this FileSystemEntity. Identical to FileStat.statSync(this.path).
///
/// Returns a FileStat object containing the data returned by stat().
///
/// If the call fails, returns a FileStat object with .type set to
/// FileSystemEntityType.notFound and the other fields invalid.
/// @description Checks that this method calls the operating system's stat()
/// function. Test directory
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory dir = getTempDirectorySync(parent: sandbox);
  File file = new File(dir.path);
  Expect.equals(FileSystemEntityType.directory, file.statSync().type);
}
