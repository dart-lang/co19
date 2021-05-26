// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a class has both a getter and a 
/// method with the same name. This restriction holds regardless of whether the 
/// getter is defined explicitly or implicitly, or whether the getter or the 
/// method are inherited or not.
/// @description Checks that a compile-time error is produced if a class has an
/// implicit getter and a method with the same name inherited from a superclass.
/// @author iefremov


class A {
  foo() {throw new A();}
}

class C extends A {
  var foo;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  try {
    new C().foo();
  } catch (e) {}
}
