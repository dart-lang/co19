// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

int? f(int? v) => v;

main() {
  var list = <int>[
    ? f(1) ?? 2,
//  ^
// [analyzer] invalid_null_aware_operator
    ? f(null) ?? 2,
//  ^
// [analyzer] invalid_null_aware_operator
    ? 2 > 1 ? 3 : 4
//  ^
// [analyzer] invalid_null_aware_operator
  ];
  Expect.listEquals([1, 2, 3], list);

  var set = <int>{
    ? f(1) ?? 2,
//  ^
// [analyzer] invalid_null_aware_operator
    ? f(null) ?? 2,
//  ^
// [analyzer] invalid_null_aware_operator
    ? 2 > 1 ? 3 : 4
//  ^
// [analyzer] invalid_null_aware_operator
  };
  Expect.setEquals({1, 2, 3}, set);

  var map = <int, int>{
    ? f(1) ?? 2: 1,
//  ^
// [analyzer] invalid_null_aware_operator
    ? f(null) ?? 2: 2,
//  ^
// [analyzer] invalid_null_aware_operator
    ? 2 > 1 ? 3 : 4: 3,
//  ^
// [analyzer] invalid_null_aware_operator
    4: ? f(1) ?? 2,
//     ^
// [analyzer] invalid_null_aware_operator
    5: ? f(null) ?? 2,
//     ^
// [analyzer] invalid_null_aware_operator
    6: ? 2 > 1 ? 3 : 4
//     ^
// [analyzer] invalid_null_aware_operator
  };
  Expect.mapEquals({
    ? f(1) ?? 2: 1,
//  ^
// [analyzer] invalid_null_aware_operator
    ? f(null) ?? 2: 2,
//  ^
// [analyzer] invalid_null_aware_operator
    ? 2 > 1 ? 3 : 4: 3,
//  ^
// [analyzer] invalid_null_aware_operator
    4: ? f(1) ?? 2,
//     ^
// [analyzer] invalid_null_aware_operator
    5: ? f(null) ?? 2,
//     ^
// [analyzer] invalid_null_aware_operator
    6: ? 2 > 1 ? 3 : 4
//     ^
// [analyzer] invalid_null_aware_operator
  }, map);
}
