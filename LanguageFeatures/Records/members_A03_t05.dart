// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks that for positional fields a getter is exposed with the
/// name `$` followed by number of preceding positional fields and whose type is
/// the type of the field. Test type of `.$i`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/static_type_helper.dart";

typedef R = (int a, String, {int x, int y});

main() {
  R r1 = (1, "", x: 3, y: 42);
  r1.$0.expectStaticType<Exactly<int>>();
  r1.$1.expectStaticType<Exactly<String>>();

  var r2 = (value: 3.14, "pi",);
  r2.$0.expectStaticType<Exactly<String>>();
}
