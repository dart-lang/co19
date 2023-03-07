// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin application of the form S with M1,...,Mk; defines a
/// class C whose superclass is the application of the mixin composition
/// Mk−1 ∗ ... ∗ M1 to S.
/// ...
/// The composition of two mixins, M1< T1...TkM1 > and M2< U1...UkM2 >,
/// written M1< T1...TkM1 > ∗ M2< U1...UkM2 > defines an anonymous mixin
/// such that for any class S< V1...VkS >, the application of
/// M1< T1...TkM1 > ∗ M2< U1...UkM2 >
/// to S< V1...VkS > is equivalent to
/// abstract class Id1< T1...TkM1, U1...UkM2, V1...VkS > =
/// Id2< U1...UkM2, V1...VkS > with M1< T1...TkM1 >;
/// where Id2 denotes
/// abstract class Id2< U1...UkM2, V1...VkS > =
/// S< V1...VkS > with M2< U1...UkM2 >;
/// @description Checks that mixin composition applies mixins in the right
/// order
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import "../../../Utils/expect.dart";

class A {
  int m = 0;
}

class M1 {
  int m = 1;
}

class M2 {
  int m = 2;
}

class M3 {
  int m = 3;
}

class B1 = A with M1, M2;
class B2 = A with M1, M2, M3;
class B3 = B1 with M3, M2, M1;

main() {
  B1 b1 = new B1();
  B2 b2 = new B2();
  B3 b3 = new B3();

  Expect.equals(2, b1.m);
  Expect.equals(3, b2.m);
  Expect.equals(1, b3.m);
}
