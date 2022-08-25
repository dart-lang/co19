// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type.
///
/// @description Checks that positional fields can be accessed using `.$i`,
/// where `i` is a zero-based index of the field
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef R = (int a, String, {int x, int y});

main() {
  R r1 = (1, "Lily was here", x: 3, y: 4);
  Expect.equals(1, r1.$0);
  Expect.equals("Lily was here", r1.$1);

  var r2 = (42, "The answer", type: "Global");
  Expect.equals(42, r2.$0);
  Expect.equals("The answer", r2.$1);

  Expect.equals(3, (name: "pi", 3, 1, 4).$0);
  Expect.equals(1, (name: "pi", 3, 1, 4).$1);
  Expect.equals(4, (3, 1, name: "pi", 4).$2);

  Expect.equals(11, (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11).$11);
}
