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
 * @static-warning
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
  try {
    c[1].v ??= 1.0; /// static type warning
  } on Exception {}
}
