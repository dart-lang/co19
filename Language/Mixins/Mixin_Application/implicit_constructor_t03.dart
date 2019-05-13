/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For each generative constructor named
 * qi(Ti1 ai1,..., Tiki aiki), i ∈ 1..n of S, C has an implicitly declared
 * constructor named qi = [C/S]qi of the form
 * qi(ai1,..., aiki): super(ai1,...,aiki);.
 * @description Checks that for each generative constructor mixin application
 * declares constructor described in the assertion
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class A {
  bool v1;
  num v2;
  A(bool this.v1, num this.v2);
}

typedef AAlias = A;

class M1 {
}

class C = AAlias with M1;

main() {
  C c = new C(true, 2);
  Expect.equals(true, c.v1);
  Expect.equals(2, c.v2);
}
