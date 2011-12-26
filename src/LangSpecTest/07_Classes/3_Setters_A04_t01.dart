/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class has both a setter and
 * a method with the same name. This restriction holds regardless of whether the setter
 * is defined explicitly or implicitly, or whether the setter or the method are inherited
 * or not.
 * @description Checks that it is a compile-time error if a class has 
 * an explicitly defined setter and an instance method with the same name.
 * @compile-error
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */

class C {
  void set foo(value) { }
  foo(value) { }
}

main() {
  try {
    new C().foo(1);
  } catch(var x) {}
}
