/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * It is a static warning if the name of the method is not either:
 * - A constructor name
 * - The name of a constructor of an interface that is in scope at the point
 * where the factory is declared.
 * @description Checks that static warning is produced if the factory constructor
 * name is neither of the two specified options.
 * @static-warning
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class C {
  C() {}
  factory redOctober() {}
}

main() {
  try {
    (new C()).redOctober();
  } catch(var e) {}
}
