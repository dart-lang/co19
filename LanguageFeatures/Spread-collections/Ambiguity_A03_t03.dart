/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion (Unified collections) Let [e] be a [setOrMapLiteral].
 *
 * If [e] has a context [C], and the base type of [C] is [Cbase] (that is,
 * [Cbase] is [C] with all wrapping [FutureOrs] removed), and [Cbase] is not
 * [?], then let [S] be the greatest closure.
 *
 * If [e] has [typeArguments] then:
 *
 * If there is exactly one type argument [T], then [e] is a set literal with
 * static type [Set<T>].
 *
 * @description Checks that [setOrMapLiteral] has one type argument, it's a set.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  Set aSet = {1, 2, 3};
  List aList = [1, 2, 3];

  var res1 = <int>{...?aSet};
  Expect.isTrue(res1 is Set);

  var res2 = <Object>{...?aList};
  Expect.isTrue(res2 is Set);
}
