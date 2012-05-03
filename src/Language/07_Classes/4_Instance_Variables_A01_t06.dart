/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an instance variable declaration
 * has one of the forms T v = e;, var v = e;, const T v = e;, const v = e;,
 * final T v = e; or final v = e; and the expression e is not a compile-time constant.
 * @description Checks that it is a compile error if an instance variable is declared
 * in the form const v = e; and e is not a compile-time constant.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

class C {
  const foo = new Object();
}

main() {
  try {
    new C().foo;
  } catch(var x){}
}
