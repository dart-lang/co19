// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks that if there is an extension with the same getters then
/// ones exposed for positional fields have a higher priority
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef R = (int a, String, {int x, int y});

extension ER on R {
  int get $0 => 42;
  String get $1 => "ER";
  void set $0(int val) {}
  void set $1(String val) {}
}

main() {
  R r1 = (1, "r1", x: 3, y: 4);
  Expect.equals(1, r1.$0);
  Expect.equals("r1", r1.$1);
  Expect.equals(42, ER(r1).$0);
  Expect.equals("ER", ER(r1).$1);
  r1.$0 = 0;
  r1.$1 = "";

  var r2 = (x: 5, y: 6, 0, "r2");
  Expect.equals(0, r2.$0);
  Expect.equals("r2", r2.$1);
  Expect.equals(42, ER(r2).$0);
  Expect.equals("ER", ER(r2).$1);
  r2.$0 = 0;
  r2.$1 = "";

  Expect.equals(1, (1, "r3", x: 7, y: 8).$0);
  Expect.equals("r3", (1, "r3", x: 7, y: 8).$1);
  Expect.equals(42, ER((1, "r3", x: 7, y: 8)).$0);
  Expect.equals("ER", ER((1, "r3", x: 7, y: 8)).$1);
  (1, "r3", x: 7, y: 8).$0 = 0;
  (1, "r3", x: 7, y: 8).$1 = "";
}
