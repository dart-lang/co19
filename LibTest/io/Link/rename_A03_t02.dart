// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if [newPath] identifies an existing file, that file
/// is replaced. The link being renamed is a link to a file
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File target = getTempFileSync(parent: sandbox);
  Link link = getTempLinkSync(parent: sandbox, target: target.path);
  File file = getTempFileSync(parent: sandbox);
  String oldTarget = link.targetSync();

  asyncStart();
  await link.rename(file.path).then((renamed) {
    Expect.equals(file.path, renamed.path);
    Expect.isTrue(renamed.existsSync());
    Expect.isFalse(link.existsSync());
    Expect.equals(oldTarget, renamed.targetSync());
    asyncEnd();
  });
}
