/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class may be defned as a mixin application.
 *
 * classDefinition:
 * metadata abstract? class mixinApplicationClass
 * ;
 * mixinClassApplication:
 * identifer typeParameters? `=' mixinApplication `;'
 *
 * mixinApplication:
 * type mixins interfaces?
 * ;
 *
 * A mixin application of the form S with M ; defines a class C with superclass
 * S.
 * A mixin application of the form S with M 1 , . . . , M k ; defines a class C
 * whose superclass is the application of the mixin composition Mk−1 ∗ ...∗ M1
 * to S.
 * In both cases above, C declares the same instance members as M (respec-
 * tively, M k ).
 * @description Checks that instance class has the same instance variables as
 * its mixins
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class A {
  int x;
  int get ga => x;
}

class M1 {
  int x;
  int y;
  int get g1x => x;
  int get g1y => y;
}

class M2 {
  int x;
  int z;
  int get g2x => x;
  int get g2z => z;
}

class B1 = A with M1;
class B2 = A with M1, M2;
class B3 = B1 with M2;

main() {
  B1 b1 = new B1();
  B2 b2 = new B2();
  B3 b3 = new B3();

  b1.x = 1;
  b2.x = 2;
  b3.x = 3;

  Expect.equals(1, b1.x);
  Expect.equals(2, b2.x);
  Expect.equals(3, b3.x);
  Expect.equals(1, b1.ga);
  Expect.equals(2, b2.ga);
  Expect.equals(3, b3.ga);
  Expect.equals(1, b1.g1x);
  Expect.equals(2, b2.g1x);
  Expect.equals(3, b3.g1x);

  b1.y = 11;
  b2.y = 12;
  b3.y = 13;

  Expect.equals(11, b1.y);
  Expect.equals(12, b2.y);
  Expect.equals(13, b3.y);
  Expect.equals(11, b1.g1y);
  Expect.equals(12, b2.g1y);
  Expect.equals(13, b3.g1y);

  b2.z = 22;
  b3.z = 23;

  Expect.equals(22, b2.z);
  Expect.equals(23, b3.z);
  Expect.equals(22, b2.g2z);
  Expect.equals(23, b3.g2z);
}
