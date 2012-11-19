/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if k’s initializer list contains an initializer
 * for a final variable f whose declaration includes an initialization expression.
 * @description Checks that a compile-time error occur when a final variable already initialized
 * at declaration is assigned a new value in a constructor's initializer list.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
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
