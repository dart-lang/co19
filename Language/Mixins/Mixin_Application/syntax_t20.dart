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
 * @description Test that mixin may have type parameters. Test that if two
 * members have the same name then mixin type
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class A<T> {
  T a;
}

class S<T> extends A<T> {
  T a;
}

class M<T> extends A<T> {
  T a;
}

class C extends S<int> with M<String> { /// static type warning
}

main() {
  C c = new C();
  c.a = "1";
  Expect.equals("1", c.a);
}
