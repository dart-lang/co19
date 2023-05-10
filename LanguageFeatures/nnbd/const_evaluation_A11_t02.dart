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
/// @description Checks that two constants are not equal if their type arguments
/// are not equal according to the runtime type equality.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

main() {
  const cNull = <Null>[];
  const cNever = <Never>[];
  const cDynamic = <dynamic>[];
  const cObject = <Object>[];
  const cNullableObject = <Object?>[];
  const cVoid = <void>[];
  const cFutureOrVoid = <FutureOr<void>>[];
  const cFutureOrDynamic = <FutureOr<dynamic>>[];
  const cFutureOrObject = <FutureOr<Object>>[];
  const cFutureOrNullableObject = <FutureOr<Object?>>[];
  const cFutureOrNull = <FutureOr<Null>>[];

  Expect.notEquals(cNull, cNever);
  Expect.notEquals(cNull, cDynamic);
  Expect.notEquals(cNull, cObject);
  Expect.notEquals(cNull, cNullableObject);
  Expect.notEquals(cNull, cVoid);
  Expect.notEquals(cNull, cFutureOrVoid);
  Expect.notEquals(cNull, cFutureOrDynamic);
  Expect.notEquals(cNull, cFutureOrObject);
  Expect.notEquals(cNull, cFutureOrNullableObject);
  Expect.notEquals(cNull, cFutureOrNull);

  Expect.notEquals(cNever, cDynamic);
  Expect.notEquals(cNever, cObject);
  Expect.notEquals(cNever, cNullableObject);
  Expect.notEquals(cNever, cVoid);
  Expect.notEquals(cNever, cFutureOrVoid);
  Expect.notEquals(cNever, cFutureOrDynamic);
  Expect.notEquals(cNever, cFutureOrObject);
  Expect.notEquals(cNever, cFutureOrNullableObject);
  Expect.notEquals(cNever, cFutureOrNull);

  Expect.notEquals(cDynamic, cObject);
  Expect.notEquals(cDynamic, cNullableObject);
  Expect.notEquals(cDynamic, cVoid);
  Expect.notEquals(cDynamic, cFutureOrVoid);
  Expect.notEquals(cDynamic, cFutureOrObject);
  Expect.notEquals(cDynamic, cFutureOrNullableObject);
  Expect.notEquals(cDynamic, cFutureOrNull);

  Expect.notEquals(cObject, cNullableObject);
  Expect.notEquals(cObject, cVoid);
  Expect.notEquals(cObject, cFutureOrVoid);
  Expect.notEquals(cObject, cFutureOrDynamic);
  Expect.notEquals(cObject, cFutureOrNullableObject);
  Expect.notEquals(cObject, cFutureOrNull);

  Expect.notEquals(cNullableObject, cVoid);
  Expect.notEquals(cNullableObject, cFutureOrVoid);
  Expect.notEquals(cNullableObject, cFutureOrDynamic);
  Expect.notEquals(cNullableObject, cFutureOrObject);
  Expect.notEquals(cNullableObject, cFutureOrNull);

  Expect.notEquals(cVoid, cFutureOrDynamic);
  Expect.notEquals(cVoid, cFutureOrObject);
  Expect.notEquals(cVoid, cFutureOrNullableObject);
  Expect.notEquals(cVoid, cFutureOrNull);

  Expect.notEquals(cFutureOrVoid, cFutureOrDynamic);
  Expect.notEquals(cFutureOrVoid, cFutureOrObject);
  Expect.notEquals(cFutureOrVoid, cFutureOrNullableObject);
  Expect.notEquals(cFutureOrVoid, cFutureOrNull);

  Expect.notEquals(cFutureOrDynamic, cFutureOrObject);
  Expect.notEquals(cFutureOrDynamic, cFutureOrNullableObject);
  Expect.notEquals(cFutureOrDynamic, cFutureOrNull);

  Expect.notEquals(cFutureOrObject, cFutureOrNullableObject);
  Expect.notEquals(cFutureOrObject, cFutureOrNull);

  Expect.notEquals(cFutureOrNullableObject, cFutureOrNull);
}
