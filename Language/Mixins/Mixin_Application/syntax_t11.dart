/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
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
 * @description Test that mixin can be derived from a class whose superclass is
 * not an Object and has all of its explicitly defined getters
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class S {
  int get g1 => 1;
}

class M1 {
  int get g2 => 2;
}

class M2 extends M1 {
  int get g3 => 3;
}

class C extends S with M2 {
}

main() {
  C c = new C();
  Expect.equals(c.g1, 1);
  Expect.equals(c.g2, 2);
  Expect.equals(c.g3, 3);
}
