// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<bool> isLink(String path)
/// Checks if type(path, followLinks: false) returns FileSystemEntityType.link.
/// @description Checks that this property returns true if
/// type(path, followLinks: false) returns FileSystemEntityType.link. Test File
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  asyncStart();
  await FileSystemEntity.isLink(file.path).then((result) async {
    Expect.isFalse(result);
    await FileSystemEntity.type(file.path, followLinks: false).then((t) {
      Expect.equals(FileSystemEntityType.file, t);
      asyncEnd();
    });
  });
}
