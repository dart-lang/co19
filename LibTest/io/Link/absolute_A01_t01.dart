// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Link absolute
/// Returns a Link instance whose path is the absolute path to this.
/// The absolute path is computed by prefixing a relative path with the current
/// working directory, and returning an absolute path unchanged.
/// @description Checks that this property returns a Link instance whose
/// path is the absolute path to this
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

_main(Directory sandbox) {
  Link link = getTempLinkSync(parent: sandbox);
  Expect.isNotNull(link.absolute);
  Expect.equals(link.path, link.absolute.path);

  String fileName = getTempFileName(extension: "lnk");
  Link link2 = new Link(fileName);
  Expect.isNotNull(link2.absolute);
  Expect.equals(Directory.current.path + Platform.pathSeparator + fileName,
      link2.absolute.path);
}
