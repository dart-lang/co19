// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Two objects T1 and T2 which are instances of Type (that is,
/// runtime type objects) are considered equal if and only if the runtime type
/// objects T1 and T2 corresponds to the types S1 and S2 respectively, and the
/// normal forms NORM(S1) and NORM(S2) are syntactically equal up to equivalence
/// of bound variables and ignoring * modifiers on types.
/// ...
/// Two constant type literals T1 and T2 compare as identical if they are equal
/// using the definition of runtime type equality specified above.
///
/// @description Checks that two constant type literals `T1` and `T2` are not
/// equal if they are not equal according to the runtime type equality.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

typedef NullableObject = Object?;
typedef Void = void;
typedef NullableFutureOrNull = FutureOr<Null>?;

testXExtendsNever<X extends Never>() {
  Expect.notEquals(X, dynamic);
  Expect.notEquals(X, Null);
  Expect.notEquals(X, Object);
  Expect.notEquals(X, NullableObject);
  Expect.notEquals(X, Void);
  Expect.notEquals(X, FutureOr<X>);
}

main() {
  Expect.notEquals(Null, dynamic);
  Expect.notEquals(Null, Never);
  Expect.notEquals(Null, Object);
  Expect.notEquals(Null, NullableObject);
  Expect.notEquals(Null, Void);
  Expect.notEquals(Null, FutureOr<Null>);
  Expect.notEquals(Null, NullableFutureOrNull);

  Expect.notEquals(dynamic, Null);
  Expect.notEquals(dynamic, Never);
  Expect.notEquals(dynamic, Object);
  Expect.notEquals(dynamic, NullableObject);
  Expect.notEquals(dynamic, Void);

  Expect.notEquals(Never, dynamic);
  Expect.notEquals(Never, Null);
  Expect.notEquals(Never, Object);
  Expect.notEquals(Never, NullableObject);
  Expect.notEquals(Never, Void);
  Expect.notEquals(Never, FutureOr<Never>);

  Expect.notEquals(Object, dynamic);
  Expect.notEquals(Object, Null);
  Expect.notEquals(Object, Never);
  Expect.notEquals(Object, NullableObject);
  Expect.notEquals(Object, Void);

  Expect.notEquals(NullableObject, dynamic);
  Expect.notEquals(NullableObject, Null);
  Expect.notEquals(NullableObject, Never);
  Expect.notEquals(NullableObject, Object);
  Expect.notEquals(NullableObject, Void);

  Expect.notEquals(Void, dynamic);
  Expect.notEquals(Void, Null);
  Expect.notEquals(Void, Never);
  Expect.notEquals(Void, Object);
  Expect.notEquals(Void, NullableObject);

  testXExtendsNever();
}
