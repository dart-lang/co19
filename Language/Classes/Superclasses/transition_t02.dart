/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class S is a superclass of a class C iff either:
 * - S is the superclass of C, or
 * - S is a superclass of a class S0 and S0 is a superclass of C.
 * @description Checks that the superclass-subclass relationship is transitive.
 * Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class A {}
typedef AAlias = A;
class B extends AAlias {}
typedef BAlias = B;
class C extends BAlias {}
typedef CAlias = C;
class D extends CAlias {}

main() {
  D d = new D();
  Expect.isTrue(d is C);
  Expect.isTrue(d is B);
  Expect.isTrue(d is A);
}
