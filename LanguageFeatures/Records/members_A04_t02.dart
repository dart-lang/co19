// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks dynamic access to record fields. Test functions and
/// constructors as records fields
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C {
  static int bar(int v) => v;
  int x;
  C(): this.x = 0;
  C.init(this.x);
}

String foo(String s) => s;

main() {
  dynamic r1 = (foo,);
  dynamic r2 = (C.init,);
  dynamic r3 = (C.new,);
  dynamic r4 = (foo: foo);
  dynamic r5 = (newC: C.new, initC: C.init);
  dynamic r6 = (foo, C.init, newC: C.new, cBar: C.bar);

  Expect.equals("Lily was here", r1.$1("Lily was here"));
  Expect.throws(() {r1.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r1.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r1.any;}, (e) => e is NoSuchMethodError);

  Expect.equals(42, r2.$1(42).x);
  Expect.throws(() {r2.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r2.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r2.any;}, (e) => e is NoSuchMethodError);

  Expect.equals(0, r3.$1().x);
  Expect.throws(() {r3.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r3.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r3.any;}, (e) => e is NoSuchMethodError);

  Expect.equals("Lily was here", r4.foo("Lily was here"));
  Expect.throws(() {r4.$1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.any;}, (e) => e is NoSuchMethodError);

  Expect.equals(0, r5.newC().x);
  Expect.equals(-1, r5.initC(-1).x);
  Expect.throws(() {r5.$1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r5.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r5.any;}, (e) => e is NoSuchMethodError);

  Expect.equals("42", r6.$1("42"));
  Expect.equals(-1, r6.$2(-1).x);
  Expect.equals(0, r6.newC().x);
  Expect.equals(1, r6.cBar(1));
  Expect.throws(() {r6.$3;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r6.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r6.any;}, (e) => e is NoSuchMethodError);
}
