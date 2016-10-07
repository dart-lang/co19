/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A case clause introduces a new scope, nested in the lexically
 * surrounding scope. The scope of a case clause ends immediately after the case
 * clause’s statement list.
 * @description Checks that the scope of a case clause ends immediately after
 * the case clause’s statement list.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  switch (2) {
    case 1: var x = 2;
            break;
    case 2: x++; /// x isn't declared in this scope
  }
}
