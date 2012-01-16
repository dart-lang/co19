/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constructor kI of I corresponds to a constructor kF of its factory class F iff either
 * - F does not implement I and kI and kF have the same name, OR
 * - F implements I and either
 *   - kI is named NI and kF is named NF , OR
 *   - kI is named NI.id and kF is named NF.id.
 * It is a compile-time error if an interface I declares a constructor kI and there 
 * is no constructor kF in the factory class F such that kI corresponds to kF .
 * @description Checks that it is a compile-time error if an interface declares a named constructor 
 * and there is no corresponding constructor in the factory class that doesn't implement that interface.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class F {
  factory I() {}
}

interface I default F {
  I();
  I.foo();
}

main() {
  try {
    new I();
    new I.foo(); // class F has no constructor I.foo()
  } catch(var e) {}
}

