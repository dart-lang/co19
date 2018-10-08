/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let [T] be a [qualified] term which denotes a generic class [G]
 * (so [T] is a raw type), let [F1 .. Fk] be the formal type parameter
 * declarations in the declaration of [G], with type parameters [X1 .. Xk] and
 * bounds [B1 .. Bk] with types [T1 .. Tk]. For [i] in [1 .. k], let [Si] denote
 * the result of performing instantiate to bound on the type in the bound, [Ti];
 * in the case where [Bi] is omitted, let [Si] be dynamic.
 * @description Checks that omitted argument type during the [Map] object
 * creation results to creating an object with correct type parameter.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";

main() {
   Map a = new Map();
   Expect.isTrue(a is Map);
   Expect.isTrue(a is Map<dynamic, dynamic>);

   Map<String, int> b = new Map();
   Expect.isTrue(b is Map);
   Expect.isTrue(b is Map<String, int>);
   Expect.isTrue(b is Map<dynamic, dynamic>);  // super-bounded type
   Expect.isTrue(b is Map<String, dynamic>);  // super-bounded type
   Expect.isTrue(b is Map<dynamic, int>);     // super-bounded type

   Expect.isFalse(b is Map<String, String>);
   Expect.isFalse(b is Map<int, dynamic>);
}
