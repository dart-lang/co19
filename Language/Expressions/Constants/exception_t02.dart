/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an expression is required to be a
 * constant expression but its evaluation would raise an exception.
 * @description Checks that an OutOfMemoryException raised during evaluation of
 * a compile-time constant it causes a runtime-time error.
 * @author iefremov
 * @reviewer rodionov
 */

const m = 1 << 999999999999999999; /// 01: runtime error

main() {
  print(m); /// 01: continued
}
