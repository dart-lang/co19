/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string starts with [other].
 * @description Checks basic cases
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "String";
  String begin = "St";
  Expect.isTrue(str.startsWith(begin) == true);
  Expect.isTrue(str.startsWith("falseBegin") == false);
  Expect.isTrue(str.startsWith("StringString") == false);
  Expect.isTrue(str.startsWith("tring") == false);
}
