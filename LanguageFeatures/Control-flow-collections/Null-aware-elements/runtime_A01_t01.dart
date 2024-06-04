// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If element is a `nullAwareExpressionElement` with expression `e`:
/// - Evaluate `e` to `v`.
///   - If `v` is not `null` then append it to result. Else the `null` is
///     discarded.
///
/// @description Check a runtime semantics of a `nullAwareExpressionElement` in
/// set collections
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  var e1 = 2 > 1 ? 1 : null;
  var e2 = 1 > 2 ? 2 : null;

  var set1 = {
    ?e1,
    ?null,
    ?e2
  };
  Expect.setEquals({e1}, set1);

  var set2 = {
    ?e1 + 1,
    ... {
      ?e1,
      ?null,
      ?e2
    },
    ?e2
  };
  Expect.setEquals({2, 1}, set2);

  var set3 = {
    if (2 > 1) ?e1,
    if (2 > 1) ?null,
    if (2 > 1) ?e2
  };
  Expect.setEquals({e1}, set3);

  var set4 = {
    for (var i = 0; i < 5; i++)
      if (i.isEven)
        ?e1 + i
      else
        ?e2
  };
  Expect.setEquals({1, 3, 5}, set4);

  var set5 = {
    for (var i in [0, 1, 2, 3, 4])
      if (i.isEven)
        ?e1 + i
      else
        ?e2
  };
  Expect.setEquals({1, 3, 5}, set5);
}
