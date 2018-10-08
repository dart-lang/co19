/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The String class represents character strings. Strings are
 * immutable.
 * @description Checks that invoking various methods of String class doesn't
 * change the original object
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String s = "Immutable String ";
  String str = "Immutable String ";

  str.substring(0, 1);
  Expect.isTrue(str == s);

  str.toLowerCase();
  Expect.isTrue(str == s);

  str.toUpperCase();
  Expect.isTrue(str == s);

  str.trim();
  Expect.isTrue(str == s);

  str.replaceFirst("mm", "m");
  Expect.isTrue(str == s);

  str.replaceAll("mm", "m");
  Expect.isTrue(str == s);
}
