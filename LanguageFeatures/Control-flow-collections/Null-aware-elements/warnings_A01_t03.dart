// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable. Test collection literals
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  int? e = 2 > 1 ? 1 : null;

  var set = <Object>{
    ?[],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?[?e],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?>[?e, null],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{?e},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?>{},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?>{?e, null},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{?e: 1},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{2: ?e},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?, int?>{e: e},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  collectionsShapeEquals({
    [],
    [e],
    <int?>[e, null],
    {e},
    <int?>{},
    <int?>{e, null},
    {e: 1},
    {2: e},
    <int?, int?>{e: e}
  }, set);

  var list = <Object>[
    ?[],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?[?e],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?>[?e, null],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{?e},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?>{?e, null},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{?e: 1},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{2: ?e},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?, int?>{e: e},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  ];
  collectionsShapeEquals([
    [],
    [e],
    <int?>[e, null],
    {e},
    {},
    <int?>{e, null},
    {e: 1},
    {2: e},
    <int?, int?>{e: e}
  ], list);

  var map1 = <Object, int>{
    ?[]: 1,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?[?e]: 2,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?>[?e, null]: 3,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{?e}: 4,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{}: 5,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?>{?e, null}: 6,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{?e: 1}: 7,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?{2: ?e}: 8,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?<int?, int?>{e: e}: 9,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  collectionsShapeEquals({
    []: 1,
    [e]: 2,
    <int?>[e, null]: 3,
    {e}: 4,
    {}: 5,
    <int?>{e, null}: 6,
    {e: 1}: 7,
    {2: e}: 8,
    <int?, int?>{e: e}: 9,
  }.keys, map1.keys);

  var map2 = <int, Object>{
    1: ?[],
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    2: ?[?e],
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    3: ?<int?>[?e, null],
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    4: ?{?e},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    5: ?{},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    6: ?<int?>{?e, null},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    7: ?{?e: 1},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    8: ?{2: ?e},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    9: ?<int?, int?>{e: e},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  collectionsShapeEquals({
    1: [],
    2: [?e],
    3: <int?>[?e, null],
    4: {?e},
    5: {},
    6: <int?>{?e, null},
    7: {?e: 1},
    8: {2: ?e},
    9: <int?, int?>{e: e},
  }.values, map2.values);
}

void collectionsShapeEquals(Iterable expected, Iterable actual) {
  Iterator expIterator = expected.iterator;
  Iterator actIterator = actual.iterator;
  while (expIterator.moveNext()) {
    Expect.isTrue(actIterator.moveNext());
    if (expIterator.current is Iterable) {
      Expect.isTrue(actIterator.current is Iterable, "${actIterator.current}");
      collectionsShapeEquals(expIterator.current , actIterator.current);
    } else if (expIterator.current is Map) {
      Expect.isTrue(actIterator.current is Map, "${actIterator.current}");
      Expect.mapEquals(expIterator.current, actIterator.current);
    } else {
      Expect.equals(expIterator.current, actIterator.current);
    }
  }
  Expect.isFalse(actIterator.moveNext());
}
