// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<FileStat> stat()
/// Calls the operating system's stat() function on the path of this
/// FileSystemEntity. Identical to FileStat.stat(this.path).
///
/// Returns a Future<FileStat> object containing the data returned by stat().
///
/// If the call fails, completes the future with a FileStat object with .type set
/// to FileSystemEntityType.notFound and the other fields invalid.
/// @description Checks that this method calls the operating system's stat()
/// function. Test link
/// @author sgrekhov@unipro.ru
/// @issue 24821

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  Link link = getTempLinkSync(parent: sandbox, target: file.path);
  Directory dir = new Directory(link.path);
  asyncStart();
  await dir.stat().then((FileStat fs) {
    // Links should be resolved.
    Expect.equals(FileSystemEntityType.file, fs.type);
    asyncEnd();
  });
}
