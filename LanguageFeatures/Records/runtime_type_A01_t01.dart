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

import "../../Utils/expect.dart";

Type typeOf<X>() => X;

class A {}
class B extends A {}
class C<T> extends B {}

main() {
  (Object, Object) r1 = (A(), B());
  Expect.runtimeIsType<(A, B)>(r1);
  Expect.equals(typeOf<(A, B)>(), r1.runtimeType);

  (A, {B name}) r2 = (B(), name: C<A?>());
  Expect.runtimeIsType<(B, {C<A?> name})>(r2);
  Expect.equals(typeOf<(B, {C<A?> name})>(), r2.runtimeType);

  (A, {B name}) r3 = (name: C<A?>(), B());
  Expect.runtimeIsType<(B, {C<A?> name})>(r3);
  Expect.equals(typeOf<(B, {C<A?> name})>(), r3.runtimeType);

  ({A value, C name}) r4 = (name: C<A>(), value: B());
  Expect.runtimeIsType<({C<A> name, B value})>(r4);
  Expect.equals(typeOf<({C<A> name, B value})>(), r4.runtimeType);

  ({A value, C<A> name}) r5 = (value: C(), name: C<B>(),);
  Expect.runtimeIsType<({C<B> name, C value})>(r5);
  Expect.equals(typeOf<({C<B> name, C value})>(), r5.runtimeType);
}
