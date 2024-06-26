// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If element is a `nullAwareExpressionElement` with expression `e`:
/// - Evaluate `e` to `v`.
///   - If `v` is not `null` then append it to result. Else the `null` is
///     discarded.
///
/// @description Check a runtime semantics of a `nullAwareExpressionElement` in
/// list collections
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

extension on int? {
  int? operator +(int other) {
    if (this != null) {
      return other + this!;
    }
    return null;
  }
}

main() {
  var e1 = 2 > 1 ? 1 : null;
  var e2 = 1 > 2 ? 2 : null;

  var list1 = [
    ?e1,
    ?null,
    ?e2
  ];
  Expect.listEquals([e1], list1);

  var list2 = [
    ?e1,
    ... [
      ?e1,
      ?null,
      ?e2
    ],
    ?e2
  ];
  Expect.listEquals([1, 1], list2);

  var list3 = [
    if (2 > 1) ?e1,
    if (2 > 1) ?null,
    if (2 > 1) ?e2
  ];
  Expect.listEquals([e1], list3);

  var list4 = [
    for (var i = 0; i < 5; i++)
      if (i.isEven)
        ?e1 + i
      else
        ?e2
  ];
  Expect.listEquals([1, 3, 5], list4);

  var list5 = [
    for (var i in [0, 1, 2, 3, 4])
      if (i.isEven)
        ?e1 + i
      else
        ?e2
  ];
  Expect.listEquals([1, 3, 5], list5);
}
