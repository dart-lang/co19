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
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {1 << (-1);}, (e) => e is ArgumentError);
}
