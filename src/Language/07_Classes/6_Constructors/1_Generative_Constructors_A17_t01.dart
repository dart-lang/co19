/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an explicit type is attached to the initializing formal, that is its static
 * type. Otherwise, the type of an initializing formal named id is Tid, where Tid is
 * the type of the field named id in the immediately enclosing class.
 * @description Checks that it's a static-type warning if an explicit type
 * of an initializing formal is not assignable to the type of the corresponding field.
 * @author msyabro
 * @reviewer iefremov
 */

import "../../../Utils/dynamic_check.dart";

class C {
  String x;
  
  C(int this.x) {} /// static type warning
}

main() {
  checkTypeError(() => new C(1));
}


