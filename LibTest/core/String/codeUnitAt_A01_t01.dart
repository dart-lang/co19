/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int codeUnitAt(int index)
 * Returns the 16-bit UTF-16 code unit at the given index.
 * @description Checks that the returned code point is correct
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue("a".codeUnitAt(0) == 0x61);
  Expect.isTrue(" ".codeUnitAt(0) == 0x20);

  Expect.isTrue("abcdefghij".codeUnitAt(9) == 0x6A);
  Expect.isTrue("\u{10000}".codeUnitAt(0) == 0xd800);
}
