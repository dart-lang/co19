/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the return type
 * of the user-declared operator equals is explicitly declared and is not bool.
 * @description Checks that it is a static warning if the return type of
 * the user-declared operator equals is explicitly declared and is not bool.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @needsreview issue 3308
 */

class C {
  int operator equals(C other) {}
}

main() {
  C c = new C();
  c == new C();
}
