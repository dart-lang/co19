/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e1 and let y be a fresh variable of
 * type T. Exactly the same static warnings that would be caused by y.id are
 * also generated in the case of e1?.id.
 * @description Check that if e.id produces static type warning then e?.id
 * produces the same warning too
 * @author sgrekhov@unipro.ru
 */

class C {
  int get m => 1;
}

main() {
  C c = new C();
  String x = c?.m; /// 01: static type warning, dynamic type error
}
