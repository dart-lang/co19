/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Exactly the same static warnings that would be caused by
 * e1.v op= e2 are also generated in the case of e1?.v op= e2.
 * @description Checks that if e1.v *= e causes warning then e1?.v *= e produces
 * the same warning as well
 * @author sgrekhov@unipro.ru
 */
class C {
  int v;
  C(int val) {
    v = val;
  }
}

main() {
  C c = new C(1);
  c?.v *= "3.14";  /// 01: static type warning, runtime error
}
