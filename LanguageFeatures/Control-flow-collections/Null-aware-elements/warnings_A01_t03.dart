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

// SharedOptions=--enable-experiment=null-aware-elements

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

main() {
  int? e = 2 > 1 ? 1 : null;

  var set = <Object>{
    ?[],
//  ^
// [analyzer] unspecified
    ?[?e],
//  ^
// [analyzer] unspecified
    ?<int?>[?e, null],
//  ^
// [analyzer] unspecified
    ?{?e},
//  ^
// [analyzer] unspecified
    ?{},
//  ^
// [analyzer] unspecified
    ?<int?>{?e, null},
//  ^
// [analyzer] unspecified
    ?{?e: 1},
//  ^
// [analyzer] unspecified
    ?{2: ?e},
//  ^
// [analyzer] unspecified
    ?<int?, int?>{e: e},
//  ^
// [analyzer] unspecified
  };
  Expect.setEquals({
    [],
    [e],
    <int?>[e, null],
    {e},
    {},
    <int?>{e, null},
    {e: 1},
    {2: e},
    <int?, int?>{e: e}
  }, set);

  var list = <Object>[
    ?[],
//  ^
// [analyzer] unspecified
    ?[?e],
//  ^
// [analyzer] unspecified
    ?<int?>[?e, null],
//  ^
// [analyzer] unspecified
    ?{?e},
//  ^
// [analyzer] unspecified
    ?{},
//  ^
// [analyzer] unspecified
    ?<int?>{?e, null},
//  ^
// [analyzer] unspecified
    ?{?e: 1},
//  ^
// [analyzer] unspecified
    ?{2: ?e},
//  ^
// [analyzer] unspecified
    ?<int?, int?>{e: e},
//  ^
// [analyzer] unspecified
  ];
  Expect.listEquals([
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
// [analyzer] unspecified
    ?[?e]: 2,
//  ^
// [analyzer] unspecified
    ?<int?>[?e, null]: 3,
//  ^
// [analyzer] unspecified
    ?{?e}: 4,
//  ^
// [analyzer] unspecified
    ?{}: 5,
//  ^
// [analyzer] unspecified
    ?<int?>{?e, null}: 6,
//  ^
// [analyzer] unspecified
    ?{?e: 1}: 7,
//  ^
// [analyzer] unspecified
    ?{2: ?e}: 8,
//  ^
// [analyzer] unspecified
    ?<int?, int?>{e: e}: 9,
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({
    []: 1,
    [e]: 2,
    <int?>[e, null]: 3,
    {e}: 4,
    {}: 5,
    <int?>{e, null}: 6,
    {e: 1}: 7,
    {2: e}: 8,
    <int?, int?>{e: e}: 9,
  }, map1);

  var map2 = <int, Object>{
    1: ?[],
//     ^
// [analyzer] unspecified
    2: ?[?e],
//     ^
// [analyzer] unspecified
    3: ?<int?>[?e, null],
//     ^
// [analyzer] unspecified
    4: ?{?e},
//     ^
// [analyzer] unspecified
    5: ?{},
//     ^
// [analyzer] unspecified
    6: ?<int?>{?e, null},
//     ^
// [analyzer] unspecified
    7: ?{?e: 1},
//     ^
// [analyzer] unspecified
    8: ?{2: ?e},
//     ^
// [analyzer] unspecified
    9: ?<int?, int?>{e: e},
//     ^
// [analyzer] unspecified
  };
  Expect.mapEquals({
    1: [],
    2: [?e],
    3: <int?>[?e, null],
    4: {?e},
    5: {},
    6: <int?>{?e, null},
    7: {?e: 1},
    8: {2: ?e},
    9: <int?, int?>{e: e},
  }, map2);
}
