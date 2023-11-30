// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Link(String path)
/// Creates a Link object.
/// @description Checks that this constructor creates a Link object. Tests that
/// file system objects are accessible via created link. Tests relative links.
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
  // create 2 Directories
  Directory dir1 = getTempDirectorySync(parent: sandbox);
  Directory dir2 = getTempDirectorySync(parent: sandbox);
  String dir2Name = getEntityName(dir2);

  // create file in dir2
  String fileName = getTempFileName();
  File file = getTempFileSync(parent: dir2, name: fileName);
  // create link to the directory dir 1
  Link link1 = getTempLinkSync(target: dir1.path, parent: sandbox);
  // in dir1 create link to dir1
  Link link2 = getTempLinkSync(parent: dir1, target: ".");

  // in dir1 create link to dir2
  Link link3 = getTempLinkSync(
      parent: dir1, target: ".." + Platform.pathSeparator + dir2Name);

  // try to access the file
  String path = link1.path +
      Platform.pathSeparator +
      getEntityName(link2) +
      Platform.pathSeparator +
      getEntityName(link3) +
      Platform.pathSeparator +
      fileName;

  File f = new File(path);

  Expect.isTrue(f.existsSync());
}
