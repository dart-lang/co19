// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Link(String path)
/// Creates a Link object.
/// @description Checks that this constructor creates a Link object. Test
/// absolute path
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Link link = new Link(dir.path + Platform.pathSeparator + "tmp.dart");
  Expect.equals(
      dir.path + Platform.pathSeparator + "tmp.dart", link.absolute.path);
}
