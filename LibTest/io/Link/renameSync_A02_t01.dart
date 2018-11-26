/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link renameSync(String newPath)
 * Synchronously renames this link. Returns a Link instance for the renamed
 * link.
 *
 * If newPath identifies an existing link, that link is replaced. If newPath
 * identifies an existing file or directory the operation fails and an exception
 * is thrown.
 * @description Checks that if newPath identifies an existing link, that link is
 * replaced
 * @author sgrekhov@unipro.ru
 * @issue 30687
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory target1 = getTempDirectorySync(parent: sandbox);
  Directory target2 = getTempDirectorySync(parent: sandbox);

  Link link1 = getTempLinkSync(target: target1.path, parent: sandbox);
  Link link2 = getTempLinkSync(target: target2.path, parent: sandbox);

  Link renamed = link1.renameSync(link2.path);
  Expect.equals(link2.path, renamed.path);
  Expect.isTrue(renamed.existsSync());
  Expect.isFalse(link1.existsSync());
}
