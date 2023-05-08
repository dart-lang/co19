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
/// @description Checks that two constant type literals `T1` and `T2` are
/// identical if they are equal according to the runtime type equality.
///
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

typedef NullableInt = int?;
typedef DoubleNullableInt = NullableInt?;
typedef NullableNever = Never?;
typedef NullableNull = Null?;
typedef NullableDynamic = dynamic?;
typedef Void = void;
typedef NullableVoid = Void?;
typedef NullableFutureNull = Future<Null>?;

main() {
  Expect.identical(NullableInt, DoubleNullableInt);
  Expect.identical(Null, NullableNever);
  Expect.identical(Null, NullableNull);
  Expect.identical(dynamic, NullableDynamic);
  Expect.identical(Void, NullableVoid);
  Expect.identical(FutureOr<void>, Void);
  Expect.identical(FutureOr<dynamic>, dynamic);
  Expect.identical(FutureOr<Object>, Object);
  Expect.identical(FutureOr<Null>, NullableFutureNull);
}
