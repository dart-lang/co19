/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  A type T is malformed iff:
 * • T has the form id or the form pref ix.id, and in the enclosing lexical scope,
 *   the name id (respectively pref ix.id) does not denote a type.
 * • T denotes a type variable in the enclosing lexical scope, but occurs in the
 *   signature or body of a static member.
 * • T is a parameterized type of the form G<S1, ..., Sn>, and G is malformed.
 * Any use of a malformed type gives rise to a static warning. A malformed
 * type is then interpreted as dynamic by the static type checker and the runtime.
 * @description Checks that it is a static warning if a type variable is used in static context.
 * @static-warning
 * @author kaigorodov
 * @issue 5809
 */

import "../../Utils/expect.dart";

class C<T> {
   static void f() {
     T v = 12;
     return v;
   }
}

main() {
  Expect.equals(12, C.f()); /// static type warning
}
