// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The runtime type of a record is determined from the runtime types
/// of its fields. There is no notion of a separate, explicitly reified type.
/// So, here:
/// ```dart
/// (num, Object) pair = (1, 2.3);
/// print(pair is (int, double)); // "true".
/// ```
/// The runtime type of `pair` is `(int, double)`, not `(num, Object)`. However,
/// the variable declaration is still valid and sound because records are
/// naturally covariant in their field types.
///
/// @description Checks that the runtime type of a record is determined from the
/// runtime types of its fields
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

Type typeOf<X>() => X;

main() {
  (num, Object) r1 = (1, 2.3);
  Expect.runtimeIsType<(int, double)>(r1);
  Expect.equals(typeOf<(int, double)>(), r1.runtimeType);

  (num, {Object name}) r2 = (3.14, name: "pi");
  Expect.runtimeIsType<(double, {String name})>(r2);
  Expect.equals(typeOf<(double, {String name})>(), r2.runtimeType);

  (num, {Object name}) r3 = (name: "pi", 3.14);
  Expect.runtimeIsType<(double, {String name})>(r3);
  Expect.equals(typeOf<(double, {String name})>(), r3.runtimeType);

  ({num value, Object name}) r4 = (name: "pi", value: 3.14);
  Expect.runtimeIsType<({String name, double value})>(r4);
  Expect.equals(typeOf<({String name, double value})>(), r4.runtimeType);

  ({num value, Object name}) r5 = (value: 3.14, name: "pi",);
  Expect.runtimeIsType<({String name, double value})>(r5);
  Expect.equals(typeOf<({String name, double value})>(), r5.runtimeType);
}
