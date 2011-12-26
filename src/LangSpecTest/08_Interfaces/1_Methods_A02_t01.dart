/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an interface method m1 overrides an
 *            interface method m2 and the type of m1 is not a subtype of the
 *            type of m2.
 * @description Checks that it is a static warning if an interface method m1
 *              overrides an interface method m2 and the type of m1 is not a
 *              subtype of the type of m2 (incompatible return types).
 * @static-type-error
 * @author rodionov
 * @reviewer kaigorodov
 */

interface I {
  int m1();
}

interface J extends I {
  String m1();
}

main() {
  J j = null;
  try {j.m1();} catch (NullPointerException e) {}
}
