/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLinkSync(String path)
 * Synchronously checks if typeSync(path, followLinks: false) returns
 * FileSystemEntityType.link.
 *
 * @description Checks that this property Synchronously checks if
 * typeSync(path, followLinks: false) returns FileSystemEntityType.link.
 * Test Link
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link link = getTempLinkSync(parent: sandbox);
  Expect.isTrue(FileSystemEntity.isLinkSync(link.path));
  Expect.equals(FileSystemEntityType.link,
      FileSystemEntity.typeSync(link.path, followLinks: false));
}
