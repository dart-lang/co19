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
/// equals if they are not equal according to the runtime type equality.
///
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

typedef NullableObject = Object?;
typedef Void = void;

main() {
  Expect.notEquals(Null, dynamic);
  Expect.notEquals(Null, Never);
  Expect.notEquals(Null, Object);
  Expect.notEquals(Null, NullableObject);
  Expect.notEquals(Null, Void);
  Expect.notEquals(Null, FutureOr<Null>);

  Expect.notEquals(dynamic, Never);
  Expect.notEquals(dynamic, Object);
  Expect.notEquals(dynamic, NullableObject);
  Expect.notEquals(dynamic, Void);

  Expect.notEquals(Never, Object);
  Expect.notEquals(Never, NullableObject);
  Expect.notEquals(Never, Void);
  Expect.notEquals(Never, FutureOr<Never>);

  Expect.notEquals(Object, NullableObject);
  Expect.notEquals(Object, Void);

  Expect.notEquals(Void, NullableObject);

  Expect.notEquals(NullableObject, FutureOr<Null>);
}
