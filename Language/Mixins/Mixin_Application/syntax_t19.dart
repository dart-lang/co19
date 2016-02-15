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
 * @description Test that mixin may have type parameters. Class C doesn't
 * specify any type parameters
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class S<T> {
  T s;
}

class M<T1, T2> {
  T1 m1;
  T2 m2;
}

class C<T> extends S with M {
  T c;
}

main() {
  C c = new C();
  c.m1 = 1;
  Expect.equals(1, c.m1);

  c.m2 = "1";
  Expect.equals("1", c.m2);

  c.s = -1;
  Expect.equals(-1, c.s);

  c.c = "-1";
  Expect.equals("-1", c.c);
}
