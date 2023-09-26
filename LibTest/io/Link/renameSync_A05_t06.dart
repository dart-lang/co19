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
/// @description Checks that if [newPath] identifies an existing link to a not
/// existing entity, that link is replaced. The link being renamed is a link to
/// a not existing entity
///
/// @note The test should be in the Administrator mode on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a [FileSystemException] will be raised with `ERROR_PRIVILEGE_NOT_HELD` set
/// as the errno when this call is made.
///
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link link1 = getTempLinkSync(target: getTempFileName(), parent: sandbox);
  Link link2 = getTempLinkSync(target: getTempFileName(), parent: sandbox);

  Link renamed = link1.renameSync(link2.path);
  Expect.equals(link2.path, renamed.path);
  Expect.isTrue(renamed.existsSync());
  Expect.isFalse(link1.existsSync());
}
