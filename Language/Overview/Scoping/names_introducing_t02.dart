/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names may be introduced into a scope by  declarations within the
 * scope or by other mechanisms such as imports or inheritance.
 * @description Checks that names may be introduced into a scope by import.
 * @author msyabro
 * @reviewer iefremov
 */

import "../lib.dart";

main() {
  AccessibleClass c;
  accessibleFuncType f = () {};
  accessibleFunction();
  accessibleVariable = 1;
}
