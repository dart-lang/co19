/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * Get the path of the file.
 * @description Checks that this property returns the path of this link.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File tmp = getTempFileSync(parent: sandbox);

  Link link = new Link(tmp.path);
  Expect.equals(tmp.path, link.path);

  link = new Link("NotExisting");
  Expect.equals("NotExisting", link.path);
}
