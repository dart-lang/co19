/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a constant constructor is declared
 * by a class that has a non-final instance variable.
 * @description Checks that a compile-time error is produced when a class with
 * constant constructor also declares a non-final instance variable.
 * @compile-error
 * @author iefremov
 */

class A {
  const A();
  var x;
}

main() {
  try {
    var a = const A();
  } catch (x) {}
}
