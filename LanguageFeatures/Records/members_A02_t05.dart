// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks that each exposed getter has the correct type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/static_type_helper.dart";

typedef R = (int a, String, {int x, bool y});

main() {
  R r1 = (1, "", x: 42, y: true);

  r1.x.expectStaticType<Exactly<int>>();
  r1.y.expectStaticType<Exactly<bool>>();

  var r2 = (name: "pi", value: 3.14);
  r2.name.expectStaticType<Exactly<String>>();
  r2.value.expectStaticType<Exactly<double>>();
}
