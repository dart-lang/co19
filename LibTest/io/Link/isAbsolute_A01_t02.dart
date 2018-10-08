/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isAbsolute
 * Returns a bool indicating whether this object's path is absolute.
 *
 * On Windows, a path is absolute if it starts with \\ or a drive letter between
 * a and z (upper or lower case) followed by :\ or :/. On non-Windows, a path is
 * absolute if it starts with /.
 * @description Checks that this property returns a bool indicating whether this
 * object's path is absolute. Test absolute path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  if (Platform.isWindows) {
    Link link = new Link(r"\\SomeFile");
    Expect.isTrue(link.isAbsolute);

    link = new Link("a:\\");
    Expect.isTrue(link.isAbsolute);

    link = new Link("Z:/something");
    Expect.isTrue(link.isAbsolute);
  } else {
    Link link = new Link("/SomeFile");
    Expect.isTrue(link.isAbsolute);

    link = new Link("/");
    Expect.isTrue(link.isAbsolute);
  }
}
