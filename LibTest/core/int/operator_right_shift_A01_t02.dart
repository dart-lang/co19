/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator >>(int shiftAmount)
 * This operator implements bit-wise right-shift operation.
 * @description Uses a large number as an argument.
 * @author vasya
 */

main() {
  int val = 100 >> 2147483647;
}
