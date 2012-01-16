/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the above rule would cause multiple members m1,..., mk with
 * the same name n to be inherited (because identically named members existed
 * in several superinterfaces) then at most one member is inherited. If the static
 * types T1,..., Tk of the members m1,..., mk are not identical, then there must
 * be a member mx such that Tx <: Ti; 1 <= x <= k for all i, 1 <= i <= k, or a static
 * type warning occurs. The member that is inherited is mx, if it exists; otherwise:
 *  - If all of m1,..., mk have the same number r of required parameters and
 *    the same set of named parameters s, then I has a method named n, with
 *    r required parameters of type Dynamic, named parameters s of type
 *    Dynamic and return type Dynamic.
 *  - Otherwise none of the members m1,..., mk is inherited.
 * @description Checks that there's a static warning produced when attempting to access
 * an interface member that is not inherited from either of the two superinterfaces
 * that declare a member with the same name because of the conflict described in this
 * assertion. Members in question are methods with different number of required parameters.
 * @author rodionov
 * @reviewer kaigorodov
 * @static-warning
 */

interface SI1 {
  void foo(var v);
}

interface SI2 {
  void foo(var v, var vv);
}

interface I extends SI1, SI2 {}

main() {
  I i = null;
  
  try {i.foo(null);} catch (NullPointerException npe) {}
}
