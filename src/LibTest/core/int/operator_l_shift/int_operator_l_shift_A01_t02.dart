/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator <<(int shiftAmount)
 * This operator implements bit-wise left-shift operation.
 * @description Uses a large number as an argument, possibly making the result too large to fit in memory.
 * @author vasya
 * @runtime-error
 * @reviewer msyabro
 * @reviewer rodionov
 * @needsreview No restrictions on this operator's argument or result are documented.
 */

main() {
  int val = 1 << 2147483647;
}
