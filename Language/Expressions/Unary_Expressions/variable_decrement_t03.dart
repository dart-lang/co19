// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form `--e` is treated as `(e-=1)`.
///
/// @description Checks that evaluation of an expression of the form `--e`
/// results in invoking `operator-` on the result of `e` with the proper
/// argument. Test nullable types.
/// @author sgrekhov22@gmail.com
/// @issue 56963

import '../../../Utils/expect.dart';

class A {
  final int value;
  A(this.value);

  A? operator -(int? other) {
    if (other != null) {
      return A(value - other);
    }
    return null;
  }
}

extension on A? {
  A? operator -(int other) {
    if (this != null) {
      return this! - other;
    }
    return null;
  }
}

extension on int? {
  int? operator -(int? other) {
    if (this != null && other != null) {
      return this! - other;
    }
    return null;
  }
}

main() {
  A? a = 2 > 1 ? A(42) : null;
  var x = --a ?? A(-1);
  Expect.equals(41, x.value);
  a = 2 > 3 ? A(42) : null;
  x = --a ?? A(-1);
  Expect.equals(-1, x.value);

  int? i = 2 > 1 ? 42 : null;
  var y = --i ?? -1;
  Expect.equals(41, y);
  i = 2 > 3 ? 42 : null;
  y = --i ?? -1;
  Expect.equals(-1, y);
}
