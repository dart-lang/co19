// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The behavior of assignment expressions is unchanged. In a pattern
/// assignment, `_` is always a wildcard.
///
/// @description Checks that in a pattern assignment `_` is always a wildcard.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

int _ = 0;

class C {
  int a, b;
  C(this.a, this.b);
}

main() {
  int x;
  (_) = (1);
  Expect.equals(0, _);

  [_, x] = [2, 0];
  Expect.equals(0, _);
  Expect.equals(0, x);

  {"key1": _, "key2": x} = {"key1": 3, "key2": 1};
  Expect.equals(0, _);
  Expect.equals(1, x);

  (_, x) = (4, 2);
  Expect.equals(0, _);
  Expect.equals(2, x);

  C(a: _, b: x) = C(5, 3);
  Expect.equals(0, _);
  Expect.equals(3, x);
}
