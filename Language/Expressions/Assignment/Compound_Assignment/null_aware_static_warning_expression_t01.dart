/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e1 and let z be a fresh variable of
 * type T. Exactly the same static warnings that would be caused by z.v = e2 are
 * also generated in the case of e1.v ??= e2
 * @description Checks that if e1.v = e causes warning then e1.v ??= e produces
 * the same warning as well
 * @author sgrekhov@unipro.ru
 * @issue 27125
 */
class C {
  int v;
  C(int val) {
    v = val;
  }
  C operator + (C c) {
    return new C(v + c.v);
  }
}

main() {
  C c1 = new C(1);
  C c2 = new C(2);
  double pi = 3.14;
  double e = 2.71;
  (c1 + c2).v ??= pi + e;  /// 01: static type warning
}
