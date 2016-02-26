/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A case clause introduces a new scope, nested in the lexically
 * surrounding scope. The scope of a case clause ends immediately after the case
 * clause’s statement list.
 * @description Checks that names from scopes of different case clauses don't
 * conflict.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

foo(p) {
  switch(p) {
    case 1: var x = 2;
            return x;
    case 2: var x = 4;
            return x;
  }
}

main() {
  Expect.equals(2, foo(1));
  Expect.equals(4, foo(2));
}
