// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Check that function types can be stored in records and then
/// accessed and invoked
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C {
  int call() => 3;
}

main() {
  (Function f1, {Function f2}) r1 = (() => 1, f2: () {return 2;});
  Expect.equals(1, r1.$1());
  Expect.equals(2, r1.f2());

  (C,) r2 = (C(),);
  Expect.equals(3, r2.$1());
}
