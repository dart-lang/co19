// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if [newPath] identifies an existing file, that file
/// is replaced. The link being renamed is a link to a directory
///
/// @note The test should be in the Administrator mode on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a [FileSystemException] will be raised with `ERROR_PRIVILEGE_NOT_HELD` set
/// as the errno when this call is made.
///
/// @author sgrekhov@unipro.ru
/// @issue 30697

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(target: target.path, parent: sandbox);
  File file = getTempFileSync(parent: sandbox);

  Link renamed = link.renameSync(file.path);
  Expect.equals(file.path, renamed.path);
  Expect.isTrue(renamed.existsSync());
  Expect.isFalse(link.existsSync());
  Expect.isFalse(file.existsSync());
}
