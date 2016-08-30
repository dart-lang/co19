/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Exactly the same static warnings that would be caused by
 * e1[e2] = e3 are also generated in the case of e1[e2] ??= e3.
 * @description Checks that if e1[e2] = e3. causes warning then e1[e2] ??= e3
 * produces the same warning as well
 * @author sgrekhov@unipro.ru
 */
class A {
  int v;
}

class C {
   A operator [](int idx) {
    return new A();
  }

  void operator []=(int idx, A val) {
  }
}

main() {
  C c = new C();
  double pi = 3.14;
  double e = 2.71;
  c[1 + 2].v ??= pi + e;  /// 01: static type warning, dynamic type error
}
