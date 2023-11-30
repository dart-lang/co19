// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory parent
/// The directory containing this.
/// @description Checks that this property returns the directory containing
/// this. Tests absolute path.
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
  Directory parent = getTempDirectorySync(parent: sandbox);

  Link link = getTempLinkSync(parent: parent);
  Expect.equals(parent.path, link.parent.path);

  link = new Link(parent.path + Platform.pathSeparator + "NotExisting");
  Expect.equals(parent.path, link.parent.path);

  link = new Link(parent.path);
  Expect.equals(parent.parent.path, link.parent.path);
}
