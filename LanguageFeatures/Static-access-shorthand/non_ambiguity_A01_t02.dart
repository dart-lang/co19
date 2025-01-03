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
/// @description Checks that `{e1? .id:e2}` is parsed like a set literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  int value;
  C(this.value);
  static C id = C(0);
}

extension on bool {
  int get id => 42;
}

main() {
  bool e1 = 2 > 1; // true
  var e2 = "value";
  Object o = C(1);
  if (o is C) {
    o = {e1? .id: e2};
    Expect.isTrue(o is Set);
    Expect.setEquals({C.id}, o as Set);
  }
}
