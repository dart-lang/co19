/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if k’s initializer list contains an initializer
 * for a ﬁnal variable f whose declaration includes an initialization expression.
 * @description Checks that a compile-time error occur if k’s initializer list contains
 * an initializer for a ﬁnal variable whose declaration includes an initialization expression.
 * @compile-error
 * @author kaigorodov
 */

class C {
  final val = null;
  C() : val = null {}
}

main() {
  try {
    C c = new C();
  } catch (x) {}
}
