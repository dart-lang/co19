// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory createTempSync([String prefix])
///  Synchronously creates a temporary directory in this directory. Additional
///  random characters are appended to prefix to produce a unique directory name.
///  If prefix is missing or null, the empty string is used for prefix.
///
///  Returns the newly created temporary directory.
/// @description Checks that this method creates a temporary directory in this
/// directory. Test prefix parameter
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory parent = getTempDirectorySync(parent: sandbox);
  Directory dir = parent.createTempSync("co19");
  Expect.equals(parent.path, dir.parent.path);
  Expect.isTrue(dir.path
      .startsWith("co19", (dir.parent.path + Platform.pathSeparator).length));
  Expect.isTrue(dir.existsSync());
}
