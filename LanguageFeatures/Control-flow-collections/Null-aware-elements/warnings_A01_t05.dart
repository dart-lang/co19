// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable. Test const collection
/// literals
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  var set = <Object>{
    ?const [],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?>[null],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const {},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?>{null},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const {null: 1},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?, int?>{2: null},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.setEquals({
    const [],
    const <int?>[null],
    const {},
    const <int?>{null},
    const {null: 1},
    const <int?, int?>{2: null},
  }, set);

  var list = <Object>[
    ?const [],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?>[null],
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const {},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?>{null},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const {null: 1},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?, int?>{2: null},
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  ];
  Expect.listEquals([
    const [],
    const <int?>[null],
    const {},
    const <int?>{null},
    const {null: 1},
    const <int?, int?>{2: null},
  ], list);

  var map1 = <Object, int>{
    ?const []: 1,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?>[null]: 2,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const {}: 3,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?>{null}: 4,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const {null: 1}: 5,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const <int?, int?>{2: null}: 6,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({
    const []: 1,
    const <int?>[null]: 2,
    const {}: 3,
    const <int?>{null}: 4,
    const {null: 1}: 5,
    const <int?, int?>{2: null}: 6
  }, map1);

  var map2 = <int, Object>{
    1: ?const [],
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    2: ?const <int?>[null],
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    3: ?const {},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    4: ?const <int?>{null},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    5: ?const {null: 1},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    6: ?const <int?, int?>{2: null},
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({
    1: const [],
    2: const <int?>[null],
    3: const {},
    4: const <int?>{null},
    5: const {null: 1},
    6: const <int?, int?>{2: null}
  }, map2);
}
