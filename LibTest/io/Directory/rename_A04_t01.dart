// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<Directory> rename(String newPath)
/// Renames this directory. Returns a Future<Directory> that completes with a
/// Directory instance for the renamed directory.
///
/// If [newPath] identifies an existing directory, then the behavior is
/// platform-specific. On all platforms, a [FileSystemException] is thrown
/// if the existing directory is not empty. On POSIX systems, if [newPath]
/// identifies an existing empty directory then that directory is deleted
/// before this directory is renamed.
///
/// If newPath identifies an existing file or link the operation fails and a
/// [FileSystemException] is thrown.
///
/// @description Checks that if [newPath] identifies an existing link, the
/// operation fails and the future completes with an exception.
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory srcDir = getTempDirectorySync(parent: sandbox);
  Directory linkDir = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(parent: sandbox, target: linkDir.path);

  asyncStart();
  await srcDir.rename(link.path).then((d) {
    Expect.fail("FileSystemException expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}
