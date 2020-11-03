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
 * ...
 * If there are exactly two type arguments [K] and [V], then [e] is a map
 * literal with static type [Map<K, V>].
 *
 * @description Checks that [setOrMapLiteral] has two type argument, it's a map.
 * @author iarkh@unipro.ru
 */

main() {
  Set aSet = {1, 2, 3};
  List aList = [1, 2, 3];

  var res1 = <int, int>{...aList};
  //                       ^^^^^
  // [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
  // [cfe] Unexpected type 'List<dynamic>' of a map spread entry.  Expected 'dynamic' or a Map.
  var res2 = <int, int>{...aSet};
  //                       ^^^^
  // [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
  // [cfe] Unexpected type 'Set<dynamic>' of a map spread entry.  Expected 'dynamic' or a Map.
}
