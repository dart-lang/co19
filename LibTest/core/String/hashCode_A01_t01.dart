/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns hash code of the string
 * @description Check that the returned hash code fulfills the requirements
 * (equal objects have equal hash codes, different objects don't)
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str1 = "a", str2 = "aa";
  Expect.isTrue(str1.hashCode != str2.hashCode);
  Expect.equals((str1 + str1).hashCode, str2.hashCode);
  Expect.equals("".hashCode, "".hashCode);
}
