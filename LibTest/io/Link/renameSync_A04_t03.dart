// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Link renameSync(String newPath)
/// Synchronously renames this link.
///
/// Returns a [Link] instance for the renamed link.
///
/// If [newPath] identifies an existing file or link, that entity is removed
/// first. If [newPath] identifies an existing directory then
/// [FileSystemException] is thrown.
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
/// @description Checks that if [newPath] identifies an existing link to a
/// directory, that link is replaced. The link being renamed is a link to
/// another link
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link target1 = getTempLinkSync(parent: sandbox, target: sandbox.path);
  Directory target2 = getTempDirectorySync(parent: sandbox);

  Link link1 = getTempLinkSync(target: target1.path, parent: sandbox);
  Link link2 = getTempLinkSync(target: target2.path, parent: sandbox);

  Link renamed = link1.renameSync(link2.path);
  Expect.equals(link2.path, renamed.path);
  Expect.isTrue(renamed.existsSync());
  Expect.isFalse(link1.existsSync());
}
