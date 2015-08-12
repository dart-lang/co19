/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  * A mixin application of the form S with M 1 , . . . , M k ;
 * defines a class C whose superclass is the application of the mixin composition M k−1
 * ∗ . . . ∗ M 1 to * S.
 * ...
 * The composition of two mixins, M 1 < T 1 . . . T k M 1 > and M 2 < U 1 . . . U k M 2 >,
 * written M 1 < T 1 . . . T k M 1 > ∗M 2 < U 1 . . . U k M 2 > defines an anonymous mixin
 * such that for any class S < V 1 . . . V k S >, the application of
 * M 1 < T 1 . . . T k M 1 > ∗M 2 < U 1 . . . U k M 2 >
 * to S < V 1 . . . V k S > is equivalent to
 * abstract class Id 1 < T 1 . . . T k M 1 , U 1 . . . U k M 2 , V 1 . . . V k S > =
 * Id 2 < U 1 . . . U k M 2 , V 1 . . . V k S > with M 1 < T 1 . . . T k M 1 >;
 * where Id 2 denotes
 * abstract class Id 2 < U 1 . . . U k M 2 , V 1 . . . V k S > =
 * S < V 1 . . . V k S > with M 2 < U 1 . . . U k M 2 >;
 * @description Checks that mixin composition applyes mixins in the right order
 * @author sgrekhov@unipro.ru
 */
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
