/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an explicit type is attached to the initializing formal, that is its static
 * type. Otherwise, the type of an initializing formal named id is Tid, where Tid is
 * the type of the field named id in the immediately enclosing class.
 * @description Checks that the type of an initializing formal is the type of the corresponding field.
 * @author iefremov
 * @reviewer kaigorodov
 */

import "../../../Utils/dynamic_check.dart";

class C {
  C(num this.x) {}
  double x;
}

main() {
  new C(3.14);
  checkTypeError(() => new C(1));
}


