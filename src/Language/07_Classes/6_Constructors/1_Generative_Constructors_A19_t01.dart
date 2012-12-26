/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the static type of id is not assignable to Tid.
 * @description Checks that it is a static warning if the static type of id is not assignable to Tid.
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  C(int this.id) {} /// static type warning
  String id;
}

main() {
  new C(null);
}
