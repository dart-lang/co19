/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an explicit type is attached to the initializing formal, that
 * is its static type. Otherwise, the type of an initializing formal named id
 * is Tid, where Tid is the type of the field named id in the immediately
 * enclosing class. It is a static warning if the static type of id is not
 * assignable to Tid.
 * @description Checks that the type of an initializing formal is the type of
 * the corresponding field.
 * @compile-error
 * @author msyabro
 */

class C {
  C(this.x) {}
  String x;
}

main() {
  new C('');
  new C(1);
}
