/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator <<(int shiftAmount)
 * This operator implements bit-wise left-shift operation.
 * @description Uses a negative number as argument.
 * @author vasya
 * @reviewer msyabro
 * @needsreview undocumented
 * @needsreview issue 1137
 */

main() {
  try {
    int val = 1 << (-1);
    Expect.fail("IllegalArgumentException expected for negative argument!");
  } on IllegalArgumentException catch(ok){}
}
