/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We define inherited(J, K) to be
 * the set of members m such that all of the following hold:
 * • m is accessible to K and
 * • A is a direct superinterface of J and either
 * – A declares a member m or
 * – m is a member of inherited(A, K).
 * • m is not overridden by J.
 * ...
 * If the above rules would cause multiple members m1 , . . . , mk with
 * the same name n to be inherited (because identically named members existed
 * in several superinterfaces) then at most one member is inherited.
 * If some but not all of the mi , 1 ≤ i ≤ k are getters none of the mi are
 * inherited, and a static warning is issued.
 * @description Checks that there is no static warning if multiple members
 * with the same name are inherited and all of them are getters or all of
 * them are methods.
 * @static-clean
 * @author ngl@unipro.ru
 */

class A1 {
  int get a => 1;
  int m() { return 11; }
}

class A2 {
  int get a => 2;
  int m() { return 12; }
}

class A3 {
  int get a => 3;
  int m() { return 13; }
}

abstract class I implements A1, A2, A3 {
}

main() {
  I i = null;
}
