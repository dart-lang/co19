// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion abstract E operator [](int index)
/// @description Checks that [Error] is thrown if [index] is of invalid type.
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0, var idx) {
  UnmodifiableListView a = new UnmodifiableListView(a0);
  Expect.throws(() { a[idx]; }, (e) => e is Error);
}

main() {
  check([null], 0.0);
  check(['sd', 'sd'], 'sd');
  check([null, 1, 0], true);
  check(new List.filled(100, null), {"a": 0});
  check(new List.filled(100, null), []);
}
