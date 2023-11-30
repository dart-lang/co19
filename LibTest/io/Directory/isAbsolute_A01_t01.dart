// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isAbsolute
/// Returns a bool indicating whether this object's path is absolute.
///
/// On Windows, a path is absolute if it starts with \\ or a drive letter between
/// a and z (upper or lower case) followed by :\ or :/. On non-Windows, a path is
/// absolute if it starts with /.
/// @description Checks that this property returns a bool indicating whether this
/// object's path is absolute. Test relative path
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory dir = new Directory(getTempDirectoryName());
  Expect.isFalse(dir.isAbsolute);

  Directory tmp = getTempDirectorySync(parent: sandbox);
  Directory dir2 = new Directory(tmp.path);
  Expect.isTrue(dir2.isAbsolute);
}
