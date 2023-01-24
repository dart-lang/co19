// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks dynamic access to record fields
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

main() {
  dynamic r1 = ();
  dynamic r2 = (42,);
  dynamic r3 = ((),);
  dynamic r4 = (($101: "Lily was here"),);
  dynamic r5 = (name: "name");
  dynamic r6 = (3.14, name: "pi");

  Expect.throws(() {r1.$1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r1.any;}, (e) => e is NoSuchMethodError);

  Expect.equals(42, r2.$1);
  Expect.throws(() {r2.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r2.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r2.any;}, (e) => e is NoSuchMethodError);

  Expect.equals((), r3.$1);
  Expect.throws(() {r3.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r3.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r3.any;}, (e) => e is NoSuchMethodError);

  Expect.equals("Lily was here", r4.$1.$101);
  Expect.throws(() {r4.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.$1.$1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.$101;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.any;}, (e) => e is NoSuchMethodError);

  Expect.equals("name", r5.name);
  Expect.throws(() {r5.$1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r5.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r5.any;}, (e) => e is NoSuchMethodError);

  Expect.equals("pi", r6.name);
  Expect.equals(3.14, r6.$1);
  Expect.throws(() {r6.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r6.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r6.any;}, (e) => e is NoSuchMethodError);
}
