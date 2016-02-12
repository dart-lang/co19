/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
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
 * @description Test that instance of class (S with M) is S
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class S {
}

class M {
}

class C1 = S with M;

class C2 extends S with M {
}

main() {
  C1 c1 = new C1();
  Expect.isTrue(c1 is S);

  C2 c2 = new C2();
  Expect.isTrue(c2 is S);
}
