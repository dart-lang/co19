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
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
class C {
  int v;
}

main() {
  C c = new C();
  try {
    c.v ??= 1.0; /// static type warning
  } on Exception {}
}
