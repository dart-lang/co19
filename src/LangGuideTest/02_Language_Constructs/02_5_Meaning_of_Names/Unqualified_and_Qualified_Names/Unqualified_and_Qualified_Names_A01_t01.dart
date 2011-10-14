/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In Dart, the syntax identifier.identifier is ambiguous.
 * It can either mean two unqualified names separated by a dot or one qualified name.
 * This ambiguity is resolved as follows: if the first identifier is a library prefix,
 * the syntax represents a single qualified name. Otherwise, it represents two unqualified
 * names separated by a dot.
 * @description Checks that identifier.identifier is resolved as two unqualified names.
 * @author msyabro
 * @reviewer iefremov
 */

class A {
  static int a;
}


main() {
  A.a;
}
