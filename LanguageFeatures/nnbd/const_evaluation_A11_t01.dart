// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Two objects T1 and T2 which are instances of Type (that is,
/// runtime type objects) are considered equal if and only if the runtime type
/// objects T1 and T2 corresponds to the types S1 and S2 respectively, and the
/// normal forms NORM(S1) and NORM(S2) are syntactically equal up to equivalence
/// of bound variables and ignoring * modifiers on types.
/// ...
/// In both sound and unsound null checking, and in both opted in and opted out
/// code, comparison of constant instances for identity is defined such that any
/// two instances which are otherwise identical except for their generic type
/// arguments shall be considered identical if those generic type arguments
/// compare equal using the definition of runtime type object equality defined
/// above. That is, comparison (or canonicalization) of constant instances of
/// generic classes is performed relative to the normal forms of their generic
/// type arguments, and ignoring legacy type annotations as described above.
/// Hence, an instance of C<T0> compares identical to C<T1> if T0 and T1 have
/// the same normal form (up to the identity of bound variables), and the
/// objects are otherwise identical.
///
/// @description Checks that two constants are identical if their type arguments
/// are equal according to the runtime type equality.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

typedef NullableInt = int?;
typedef Void = void;
typedef NullableVoid = Void?;

main() {
  const cNullableInt = <int?>[];
  const cDoubleNullableInt = <NullableInt?>[];
  const cNullableNever = <Never?>[];
  const cNullableNull = <Null?>[];
  const cNull = <Null>[];
  const cDynamic = <dynamic>[];
  const cNullableDynamic = <dynamic?>[];
  const cVoid = <void>[];
  const cNullableVoid = <NullableVoid>[];
  const cFutureOrVoid = <FutureOr<void>>[];
  const cFutureOrDynamic = <FutureOr<dynamic>>[];
  const cFutureOrObject = <FutureOr<Object>>[];
  const cObject = <Object>[];
  const cNullableFutureNull = <Future<Null>?>[];
  const cFutureOrNull = <FutureOr<Null>>[];

  Expect.identical(cNullableInt, cDoubleNullableInt);
  Expect.identical(cNull, cNullableNever);
  Expect.identical(cNull, cNullableNull);
  Expect.identical(cDynamic, cNullableDynamic);
  Expect.identical(cVoid, cNullableVoid);
  Expect.identical(cFutureOrVoid, cVoid);
  Expect.identical(cFutureOrDynamic, cDynamic);
  Expect.identical(cFutureOrObject, cObject);
  Expect.identical(cFutureOrNull, cNullableFutureNull);
}
