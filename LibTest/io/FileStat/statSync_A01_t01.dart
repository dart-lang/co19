// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion FileStat statSync(String path)
/// Calls the operating system's stat() function on path. Returns a FileStat
/// object containing the data returned by stat(). If the call fails, returns a
/// FileStat object with .type set to FileSystemEntityType.notFound and the
/// other fields invalid.
/// @description Checks that this method calls the operating system's stat()
/// function on path. Returns a FileStat object containing the data returned by
/// stat()
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  File file = getTempFileSync(parent: sandbox);
  FileStat fs = FileStat.statSync(file.path);
  Expect.equals(FileSystemEntityType.file, fs.type);
  Expect.equals(0, fs.size);
  Expect.equals(file.statSync().mode, fs.mode);
  Expect.equals(file.statSync().accessed, fs.accessed);
  Expect.equals(file.statSync().changed, fs.changed);
  Expect.equals(file.statSync().modified, fs.modified);
}
