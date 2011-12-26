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
 * @description Checks that there's no static warning when the factory constructor
 * name is the name of a built-in interface (int).
 * @author rodionov
 * @needsreview How to invoke this factory constructor if int does not specify C as
 * its default implementation?
 */

class C {
  C() {}
  factory int() {}
}

main() {
  new C();
}
