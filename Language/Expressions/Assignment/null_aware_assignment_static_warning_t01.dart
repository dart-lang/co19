/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e1 and let y be a fresh variable of
 * type T. Exactly the same static warnings that would be caused by y.v = e2 are
 * also generated in the case of e1?.v = e2.
 * @description Checks that if e1.v = e2 produces ctatic warning then e1?.v = e2
 * produces the same warning too
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/dynamic_check.dart';

class C {
  int v;
}

main() {
  double e = 3.14;
  C c = new C();
  try {
    c?.v = e; /// static type warning
  } catch (everything) {
  }
}
