// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<FileStat> stat()
/// Calls the operating system's stat() function on the path of this
/// FileSystemEntity. Identical to FileStat.stat(this.path).
///
/// Returns a Future<FileStat> object containing the data returned by stat().
///
/// If the call fails, completes the future with a FileStat object with .type
/// set to FileSystemEntityType.notFound and the other fields invalid.
/// @description Checks that this method calls the operating system's stat()
/// function. Test directory
/// @Issue 24821
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Link link = new Link(dir.path);
  asyncStart();
  await link.stat().then((FileStat fs) {
    Expect.equals(FileSystemEntityType.directory, fs.type);
    asyncEnd();
  });
}
