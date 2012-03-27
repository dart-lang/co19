/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an instance method m1 overrides an instance
 * member m2 and m1 does not declare all the named parameters declared by m2 in the same order.
 * @description Checks that a compile-time error is produced if m1 has the same set of named parameters as
 * m2 but in a different order.
 * @compile-error
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  f([var x1, var x2, var wrongOrder1, var wrongOrder2]) { return '$x1$wrongOrder2'; }
}

class C extends A {
  f([var x1, var x2, var wrongOrder2, var wrongOrder1]) { return '$x1$wrongOrder1'; }
}

main() {
  try {
    new A().f("Nothing", "endures", "but", "change");
    new C().f("Nothing", "endures", "but", "change");
  } catch(var x) {}
}

