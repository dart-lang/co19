// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let Sstatic be the superclass of the immediately enclosing class.
/// It is a static type warning if Sstatic does not have an accessible instance
/// member named m unless Sstatic or a superinterface of Sstatic is annotated
/// with an annotation denoting a constant identical to the constant @proxy
/// deﬁned in dart:core.
/// @description Checks that there is a compile error if superclass
/// does not have an instance member named m
/// @author kaigorodov

class I {}

class S extends I {}

class A extends S {
  test() {
    super.nonExistingMethod();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  A a = new A();
}
