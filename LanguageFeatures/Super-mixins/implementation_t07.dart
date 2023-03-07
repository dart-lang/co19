// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a mixin declaration like
/// mixin A<X extends S, Y extends T> on B, C implements D, E { body }
/// the on clause declares the interfaces B and C as super-class constraints of
/// the mixin. Having a super-class constaint allows the mixin declaration
/// instance members to perform super-invocations (like super.foo()) if they are
/// allowed by a class implementing both B and C. The mixin introduced by A can
/// then only be applied to classes that implement both B and C.
///
/// @description Checks that mixin declaration can only be applied to classes
/// that implement both B and C. Test the case when mixin declaration is applied
/// to the class with mixins only one of the interfaces
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

class B {
  String get gb1 => "B.gb1";
}
abstract class C {
  String get gc1;
}

class A extends Object with B {
  String get gc1 => "A.gc1";
}

mixin M on B, C {}

class MA extends A with M {
//                      ^
// [analyzer] unspecified
//    ^
// [cfe] unspecified
}

main() {
  new MA();
}
