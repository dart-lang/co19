/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a declared or derived mixin refers to super.
 * @description Checks that it is a compile-time error if a derived mixin
 * refers to super.
 * @compile-error
 * @author kaigorodov
 */
 
class A {
  var x;
}

class M {
  String toString() {return super.toString();}
}

class AM extends A with M {
}

main() {
  AM am = new AM();
  String s=am.toString(); 
}
