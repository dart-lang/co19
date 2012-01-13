/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the scalar character code at the given [index].
 * @description Checks that the returned code point is correct
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  Expect.isTrue("a".charCodeAt(0) == 0x61);
  Expect.isTrue(" ".charCodeAt(0) == 0x20);

  Expect.isTrue("abcdefghij".charCodeAt(9) == 0x6A);
  Expect.isTrue("\u{10000}".charCodeAt(0) == 0x10000);
}
