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
 * @description Check that if mixin has superclass other than object then
 * super calls are allowed in its declared members and if both S and
 * superclass of M have member with the same name m, then the one from S is
 * called. Test class C = S with M; syntax
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class A {
  String a() => "A";
}

class B extends A {
  String a() => "B";
}

class S extends B {
}

class M extends A {
  String m() {
    return super.a();
  }
}

class C = S with M;

main() {
  C c = new C();
  Expect.equals("B", c.m());
}
