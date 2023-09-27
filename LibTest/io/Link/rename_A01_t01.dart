// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<Link> rename(String newPath)
/// Renames this link.
///
/// Returns a `Future<Link>` that completes with a [Link] for the renamed link.
///
/// If [newPath] identifies an existing file or link, that entity is removed
/// first. If [newPath] identifies an existing directory then the future
/// completes with a [FileSystemException].
///
/// @note Shortly:
/// - [File]/[Link] `rename/renameSync` can replace other [File]/[Link] but not
///   [Directory]
/// - [Directory] `rename/renameSync` can not replace an existing
///   [File]/[Link]/[Directory] except on POSIX where it can replace an empty
///   [Directory]
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a [FileSystemException] will be raised with `ERROR_PRIVILEGE_NOT_HELD` set
/// as the errno when this call is made.
///
/// @description Checks that this method returns a `Future<Link>` that completes
/// with a [Link] instance for the renamed link.
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link link = getTempLinkSync(parent: sandbox);
  String target = link.targetSync();
  String newName = getTempFilePath(parent: sandbox);

  asyncStart();
  await link.rename(newName).then((renamed) {
    Expect.equals(newName, renamed.path);
    Expect.equals(target, renamed.targetSync());
    Expect.isTrue(renamed.existsSync());
    Expect.isFalse(link.existsSync());
    asyncEnd();
  });
}
