/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the code point at the given [index].
 * @description Check some trivial cases
 * @author msyabro
 */


main() {
  String str1 = "s";
  String str2 = "string";
  
  Expect.isTrue(str1[0] == 's');
  Expect.isTrue(str2[str2.length - 1] == 'g');
  Expect.isTrue("anotherString"[1] == 'n');
  Expect.isTrue(" "[0] == '\x20');
  Expect.isTrue("a\nb"[1] == '\x0A');
}
