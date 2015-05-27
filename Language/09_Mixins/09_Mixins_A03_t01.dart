/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile-time error if a mixin is derived from a class
 * whose superclass is not Object.
 * @description Checks that it is a compile-time error if a mixin is derived
 * from a class whose superclass is not Object.
 * @compile-error
 * @author kaigorodov
 */
 
class A {
  var x;
}

class M0 {
}

class M extends M0 {
}

class AM extends A with M {
}

main() {
  AM am = new AM();
  String s=am.toString(); 
}
