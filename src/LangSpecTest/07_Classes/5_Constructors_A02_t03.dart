/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no constructor is specified for a class C, it implicitly has
 * a default constructor C() : super() {}, unless it is class Object.
 * @description Checks that 'default' constructor is not generated if the class 
 * declares a named constructor.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 * @needsreview issue 954
 */

class C {
  var x;
  C.someConstructor(this.x);
}

main() {
  try {
    new C();
  } catch(var x) {}
}
