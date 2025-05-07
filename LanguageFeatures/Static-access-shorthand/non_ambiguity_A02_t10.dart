// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A postfix expression expression can follow a `?` in a conditional
/// expression, as in `{e1 ? . id : e2}`. This is not ambiguous with `e1?.id`
/// since we parse `?.` as a single token, and will keep doing so. It does mean
/// that `{e1?.id:e2}` and `{e1? .id:e2}` will now both be valid and have
/// different meanings, where the existing grammar didn’t allow the `?` token to
/// be followed by `.` anywhere.
///
/// @description Checks that spread collections  `...?.id` is treated as
/// `...? Iterable.id`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

main() {
  var list = <num>[
    ...? .castFrom<num, int>([1, 2, 3]) // ignore: invalid_null_aware_operator
  ];
  Expect.listEquals([1, 2, 3], list);

  var set = <num>{
    ...? .castFrom<num, int>({1, 2, 3}) // ignore: invalid_null_aware_operator
  };
  Expect.setEquals({1, 2, 3}, set);

  var map1 = <String, num>{
    ...? .castFrom<String, num, String, int>({"key1": 1, "key2": 2, "key3": 3}) // ignore: invalid_null_aware_operator
  };
  Expect.mapEquals({"key1": 1, "key2": 2, "key3": 3}, map1);

  var map2 = <num, String>{
    ...? .castFrom<num, String, int, String>({1: "v1", 2: "v2", 3: "v3"}) // ignore: invalid_null_aware_operator
  };
  Expect.mapEquals({1: "v1", 2: "v2", 3: "v3"}, map2);
}
