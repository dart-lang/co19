/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int codeUnitAt(int index)
 * Throws RangeError if [index] is out of bounds
 * @description Checks that an RangeError is thrown when the index is out of
 * range
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void checkIOOR(String str, int index) {
  Expect.throws(() {str.codeUnitAt(index);}, (e) => e is RangeError);
}

main() {
  checkIOOR("", 0);
  checkIOOR("string", -1);
  checkIOOR("string", 0x80000000);
  checkIOOR("string", 0x7fffffff);
  checkIOOR("string", 6);
}
