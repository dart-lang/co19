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
 * @description Checks that if multiple members with the same name are inherited
 * but not all of them are getters then a compile error occurs
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

abstract class SI1 {
  int get m => 1;
}

abstract class SI2 {
  int get m => 2;
}

abstract class SI3 {
  int m();
}

abstract class I implements SI1, SI2, SI3 {
}

main() {
  I i = null;
}
