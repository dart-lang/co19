/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class may be defined as a mixin application.
 *
 * classDefinition:
 *   metadata abstract? class mixinApplicationClass
 * ;
 * mixinApplicationClass:
 *   identifier typeParameters? `=' mixinApplication `;'
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
 * @description Checks that it is no compile error to derive a mixin from a
 * class which has a superclass other than Object, even if mixin has all of its
 * instance variables
 * @issue 26409
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class S {
  var v1;
}

class M extends S {
  var v2;
}

class A extends S {
  var v3;
}

class C extends A with M {
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
