/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class may be defned as a mixin application.
 *
 * classDefinition:
 *   metadata abstract? class mixinApplicationClass
 * ;
 * mixinClassApplication:
 *   identifer typeParameters? `=' mixinApplication `;'
 *
 * mixinApplication:
 *   type mixins interfaces?
 * ;
 *
 * A mixin application of the form S with M; defines a class C with superclass
 * S.
 * A mixin application of the form S with M1,...,Mk; defines a class C whose
 * superclass is the application of the mixin composition Mk−1∗...∗M1 to S.
 * In both cases above, C declares the same instance members as M (respec-
 * tively, Mk).
 * @description Checks that mixin application of the form S with M1,...,Mk;
 * defines a class C with superclass S with M1,...Mk-1. So if Mi have methods
 * with the same names then Mk method overrides the ones from Mi
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class S {
  String get m => "S";
}

class M1 {
  String get m => "M1";
}

class M2 {
  String get m => "M2";
}

class M3 {
  String get m => "M3";
}

class C1 extends S with M1 {
  test() {
    Expect.equals("M1", super.m);
  }
}

class C2 extends S with M1, M2 {
  test() {
    Expect.equals("M2", super.m);
  }
}

class C3 extends S with M1, M2, M3 {
  test() {
    Expect.equals("M3", super.m);
  }
}

main() {
  C1 c1 = new C1();
  c1.test();

  C2 c2 = new C2();
  c2.test();

  C3 c3 = new C3();
  c3.test();
}
