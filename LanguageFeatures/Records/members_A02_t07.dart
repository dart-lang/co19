// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks that if there is an extension method with the same name
/// as a getter exposed by a record, then the record getter has a higher priority.
/// ones exposed for named fields have a higher priority
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef R = (int a, String, {int x, int y});

extension ER on R {
  int get x => 42;
  int get y => 21;
  void set x(int val) {}
  void set y(int val) {}
}

main() {
  R r1 = (1, "r1", x: 3, y: 4);
  Expect.equals(3, r1.x);
  Expect.equals(4, r1.y);
  Expect.equals(42, ER(r1).x);
  Expect.equals(21, ER(r1).y);
  r1.x = 0;
  r1.y = 0;

  var r2 = (x: 5, y: 6, 0, "r2");
  Expect.equals(5, r2.x);
  Expect.equals(6, r2.y);
  Expect.equals(42, ER(r2).x);
  Expect.equals(21, ER(r2).y);
  r2.x = 0;
  r2.y = 0;

  Expect.equals(7, (1, "r3", x: 7, y: 8).x);
  Expect.equals(8, (1, "r3", x: 7, y: 8).y);
  Expect.equals(42, ER((1, "r3", x: 7, y: 8)).x);
  Expect.equals(21, ER((1, "r3", x: 7, y: 8)).y);
  (1, "r3", x: 7, y: 8).x = 0;
  (1, "r3", x: 7, y: 8).y = 0;
}
