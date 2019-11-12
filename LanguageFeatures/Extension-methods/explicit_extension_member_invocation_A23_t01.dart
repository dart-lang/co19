/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A pre-increment expression of the form ++e1.id is generally
 * equivalent to e1.id += 1. Similarly for --e1.id, ++e1[e2] and --e1[e2]. This
 * applies when e1 is an extension application too, reducing it to the former
 * case.
 *
 * A post-increment expression of the form e1.id++ is generally equivalent to
 * e1.id += 1 (which is e1.id = e1.id + 1 except that subexpressions of e1 are
 * not evaluated more than once), but the value of the expression is the value
 * from evaluating e1.id before adding 1.
 *
 * @description Check ++e1.id and e1.id++ values
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  int value;
  C() : value = 0 {}
  init() {
    value = 0;
  }
}

extension Ext on C {
  int get id => this.value;
  void set id(int v) {this.value = v;}
}

main() {
  C c = C();
  Expect.equals(1, ++Ext(c).id);
  c.init();
  Expect.equals(0, Ext(c).id++);
}
