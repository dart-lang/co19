// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void updateSync(String target)
/// Synchronously updates the link. Calling updateSync on a non-existing link
/// will throw an exception.
///
/// On the Windows platform, this will only work with directories, and the
/// target directory must exist.
/// @description Check that calling updateSync on a non-existing link will throw
/// an exception. Tests the case when target does not exist.
///
/// @note The test should run with the Administrator priveleges on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD set as
/// the errno when this call is made.
///
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory target = getTempDirectorySync(parent: sandbox);
  String newTarget = getTempDirectoryPath(parent: sandbox);
  Link link = new Link(getTempFilePath(parent: sandbox));
  link.createSync(target.path);
  link.updateSync(newTarget);
  Expect.equals(newTarget, link.targetSync());
}
