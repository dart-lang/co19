/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Test that mixin can be derived from a class whose superclass is
 * not an Object and has all of its instance variables
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class S {
  var v1;
}

class M1 {
  var v2;
}

class M2 extends M1 {
  var v3;
}

class C extends S with M2 {
}

main() {
  C c = new C();
  c.v1 = 1;
  c.v2 = 2;
  c.v3 = 3;
  Expect.equals(c.v1, 1);
  Expect.equals(c.v2, 2);
  Expect.equals(c.v3, 3);
}
