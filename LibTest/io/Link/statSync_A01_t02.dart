// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion FileStat statSync()
/// Synchronously calls the operating system's stat() function on the path of
/// this FileSystemEntity. Identical to FileStat.statSync(this.path).
///
/// Returns a FileStat object containing the data returned by stat().
///
/// If the call fails, returns a FileStat object with .type set to
/// FileSystemEntityType.notFound and the other fields invalid.
/// @description Checks that this method identical to
/// FileStat.statSync(this.path)
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
  Link link = getTempLinkSync(parent: sandbox);
  FileStat fs = link.statSync();
  FileStat fs2 = FileStat.statSync(link.path);
  Expect.equals(fs2.type, fs.type);
  Expect.equals(fs2.mode, fs.mode);
  Expect.equals(fs2.changed, fs.changed);
  Expect.equals(fs2.modified, fs.modified);
  Expect.equals(fs2.size, fs.size);
  Expect.equals(fs2.accessed, fs.accessed);
}
