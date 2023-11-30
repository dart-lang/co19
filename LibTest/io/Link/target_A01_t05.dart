// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<String> target()
/// Gets the target of the link. Returns a future that completes with the path
/// to the target.
///
/// If the returned target is a relative path, it is relative to the directory
/// containing the link.
///
/// If the link does not exist, or is not a link, the future completes with a
/// FileSystemException.
/// @description Check that this method returns the target of the link. Tests
/// link as a target.
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

void _main(Directory sandbox) async {
  Link target = getTempLinkSync(parent: sandbox);
  Link link = new Link(getTempFilePath(parent: sandbox));
  link.createSync(target.path);

  asyncStart();
  await link.target().then((String path) {
    Expect.equals(target.path, path);
    asyncEnd();
  });
}
