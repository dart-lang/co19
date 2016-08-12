/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a constant constructor is declared
 * by a class that has a non-final instance variable.
 * @description Checks that compile-time error is produced when a class with
 * constant constructor inherits a non-final instance variable.
 * @compile-error
 * @author iefremov
 */

class C {
  var x;
}

class CC extends C {
}

class A extends CC {
  const A();
}

main() {
  try {
    var a = const A();
  } catch (x) {}
}
