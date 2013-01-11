/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator ~/(num other)
 * @description Checks that if both operands are infinite the result is an error.
 * @author pagolubev
 * @reviewer msyabro
 */


final double positiveInf = 1 / 0;
final double negativeInf = -1 / 0;

main() {
  Expect.throws(() {
    positiveInf ~/ positiveInf;
  });
  
  Expect.throws(() {
    positiveInf ~/ negativeInf;
  });
  
  Expect.throws(() {
    negativeInf ~/ positiveInf;
  });
  
  Expect.throws(() {
    negativeInf ~/ negativeInf;
  });
}
