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
import "../../../Utils/file_utils.dart";

main() {
  File tmp = getTempFileSync();
  try {
    Link link = new Link(tmp.path);
    Expect.equals(tmp.path, link.path);

    link = new Link("NotExisting");
    Expect.equals("NotExisting", link.path);
  } finally {
    tmp.delete();
  }
}
