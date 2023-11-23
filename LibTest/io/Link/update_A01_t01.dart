// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<Link> update(String target)
/// Updates the link. Returns a Future<Link> that completes with the link when
/// it has been updated. Calling update on a non-existing link will complete its
/// returned future with an exception.
///
/// On the Windows platform, this will only work with directories, and the
/// target directory must exist.
///
/// @description Check that this method updates the link. Tests directory as a
/// target
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

_main(Directory sandbox) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  Directory newTarget = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(target: target.path, parent: sandbox);

  asyncStart();
  await link.update(newTarget.path).then((Link l) {
    Expect.equals(newTarget.path, l.targetSync());
    asyncEnd();
  });
}
