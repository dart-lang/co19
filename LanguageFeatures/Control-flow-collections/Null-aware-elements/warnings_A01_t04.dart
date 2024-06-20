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

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

int? f(int? v) => v;

main() {
  var list = <int>[
    ? f(1) ?? 2,
//  ^
// [analyzer] unspecified
    ? f(null) ?? 2,
//  ^
// [analyzer] unspecified
    ? 2 > 1 ? 3 : 4
//  ^
// [analyzer] unspecified
  ];
  Expect.listEquals([1, 2, 3], list);

  var set = <int>{
    ? f(1) ?? 2,
//  ^
// [analyzer] unspecified
    ? f(null) ?? 2,
//  ^
// [analyzer] unspecified
    ? 2 > 1 ? 3 : 4
//  ^
// [analyzer] unspecified
  };
  Expect.setEquals({1, 2, 3}, set);

  var map = <int, int>{
    ? f(1) ?? 2: 1,
//  ^
// [analyzer] unspecified
    ? f(null) ?? 2: 2,
//  ^
// [analyzer] unspecified
    ? 2 > 1 ? 3 : 4: 3,
//  ^
// [analyzer] unspecified
    4: ? f(1) ?? 2,
//     ^
// [analyzer] unspecified
    5: ? f(null) ?? 2,
//     ^
// [analyzer] unspecified
    6: ? 2 > 1 ? 3 : 4
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({
    ? f(1) ?? 2: 1,
    ? f(null) ?? 2: 2,
    ? 2 > 1 ? 3 : 4: 3,
    4: ? f(1) ?? 2,
    5: ? f(null) ?? 2,
    6: ? 2 > 1 ? 3 : 4
  }, map);
}
