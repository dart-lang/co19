// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory absolute
/// Returns a Directory instance whose path is the absolute path to this.
///
/// The absolute path is computed by prefixing a relative path with the current
/// working directory, and returning an absolute path unchanged.
/// @description Checks that this property returns a Directory instance whose
/// path is the absolute path to this. Test parent property
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../file_utils.dart";
import "../../../Utils/expect.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory tmp = getTempDirectorySync(parent: sandbox);
  Directory dir =
      new Directory(tmp.path + Platform.pathSeparator + "TestDir");
  Expect.equals(tmp.path, dir.absolute.parent.path);
}
