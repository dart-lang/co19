/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A formal constructor parameter is either a formal parameter or
 * an initializing formal. An initializing formal has the form this.id, where
 * id is the name of an instance variable of the immediately enclosing class.
 * It is a compile-time error if id is not the name of an instance variable of
 * the immediately enclosing class.
 * @description Checks that various correct constructor parameters do not
 * produce compile-time errors. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class C {
  C() {}
  C.initialFormal(this.x, int this.y, this.z) {}
  C.mixed(p1, this.x, [p2, this.y]) {}

  int x, y, z;
}
typedef CAlias = C;

main() {
  new CAlias();
  new CAlias.initialFormal(1, 2, 3);
  new CAlias.mixed(null, null);
}
