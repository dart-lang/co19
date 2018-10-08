/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile time error if a class C declares a member with 
 * the same name as C.
 * @description Checks that a class name cannot be used as a name of a member 
 * variable.
 * @author hlodvig
 * @compile-error
 */

class A {
  var A;
}

main() {
  new A();
}
