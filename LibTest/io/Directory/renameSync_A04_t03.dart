// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory renameSync(String newPath)
/// Synchronously renames this directory. Returns a Directory instance for the
/// renamed directory.
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
/// @note Shortly:
/// - [File]/[Link] `rename/renameSync` can replace other [File]/[Link] but not
///   [Directory]
/// - [Directory] `rename/renameSync` can not replace an existing
///   [File]/[Link]/[Directory] except on POSIX where it can replace an empty
///   [Directory]
///
/// @description Checks that if [newPath] identifies an existing link to a
/// file, the operation fails and an exception is thrown.
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory srcDir = getTempDirectorySync(parent: sandbox);
  File file = getTempFileSync(parent: sandbox);
  Link link1 = getTempLinkSync(parent: sandbox, target: file.path);
  Link link2 = getTempLinkSync(parent: sandbox, target: link1.path);

  Expect.throws(() {
    srcDir.renameSync(link2.path);
  }, (e) => e is FileSystemException);
  Expect.isTrue(srcDir.existsSync());
  Expect.isTrue(link2.existsSync());
}
