// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type. For each
/// positional field, it exposes a getter whose name is $ followed by the number
/// of preceding positional fields and whose type is the type of the field.
///
/// @description Checks dynamic access to record fields. Test generic functions
/// and constructors as records fields
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C<T> {
  static X bar<X>(X v) => v;
  T x;
  C(this.x);
}

T foo<T>(T t) => t;

main() {
  dynamic r1 = (foo<int>,);
  dynamic r2 = (C<String>.new,);
  dynamic r3 = (foo: foo<int>);
  dynamic r4 = (foo<String>, newC: C<int>.new, cBar: C.bar<bool>);

  Expect.equals(42, r1.$1(42));
  Expect.throws(() {r1.$1("");});
  Expect.throws(() {r1.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r1.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r1.any;}, (e) => e is NoSuchMethodError);

  Expect.equals("Hi", r2.$1("Hi").x);
  Expect.throws(() {r2.$1(42);});
  Expect.throws(() {r2.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r2.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r2.any;}, (e) => e is NoSuchMethodError);

  Expect.equals(1, r3.foo(1));
  Expect.throws(() {r3.foo("");});
  Expect.throws(() {r3.$1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r3.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r3.any;}, (e) => e is NoSuchMethodError);

  Expect.equals("Lily was here", r4.$1("Lily was here"));
  Expect.throws(() {r4.$1(42);});
  Expect.equals(1, r4.newC(1).x);
  Expect.throws(() {r4.newC("");});
  Expect.isTrue(r4.cBar(true));
  Expect.throws(() {r4.cBar(42);});
  Expect.throws(() {r4.$2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.$100000000000000000000;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {r4.any;}, (e) => e is NoSuchMethodError);
}
