// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory parent
/// The directory containing this.
/// @description Checks that this property returns the directory containing this.
/// Test absolute path
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory parent = getTempDirectorySync(parent: sandbox);
  File file = getTempFileSync(parent: parent);
  Expect.equals(parent.path, file.parent.path);

  file = new File(parent.path + Platform.pathSeparator + "NotExisting");
  Expect.equals(parent.path, file.parent.path);

  file = new File(parent.path);
  Expect.equals(parent.parent.path, file.parent.path);
}
