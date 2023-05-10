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
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

testXExtendsNever<X extends Never>() {
  Expect.notEquals(Set<X>, Set<dynamic>);
  Expect.notEquals(Set<X>, Set<Null>);
  Expect.notEquals(Set<X>, Set<Object>);
  Expect.notEquals(Set<X>, Set<Object?>);
  Expect.notEquals(Set<X>, Set<void>);
  Expect.notEquals(Set<X>, Set<FutureOr<X>>);
}

main() {
  Expect.notEquals(Set<Null>, Set<dynamic>);
  Expect.notEquals(Set<Null>, Set<Never>);
  Expect.notEquals(Set<Null>, Set<Object>);
  Expect.notEquals(Set<Null>, Set<Object?>);
  Expect.notEquals(Set<Null>, Set<void>);
  Expect.notEquals(Set<Null>, Set<FutureOr<Null>>);
  Expect.notEquals(Set<Null>, Set<FutureOr<Null>?>);

  Expect.notEquals(Set<dynamic>, Set<Null>);
  Expect.notEquals(Set<dynamic>, Set<Never>);
  Expect.notEquals(Set<dynamic>, Set<Object>);
  Expect.notEquals(Set<dynamic>, Set<Object?>);
  Expect.notEquals(Set<dynamic>, Set<void>);

  Expect.notEquals(Set<Never>, Set<dynamic>);
  Expect.notEquals(Set<Never>, Set<Null>);
  Expect.notEquals(Set<Never>, Set<Object>);
  Expect.notEquals(Set<Never>, Set<Object?>);
  Expect.notEquals(Set<Never>, Set<void>);
  Expect.notEquals(Set<Never>, Set<FutureOr<Never>>);

  Expect.notEquals(Set<Object>, Set<dynamic>);
  Expect.notEquals(Set<Object>, Set<Null>);
  Expect.notEquals(Set<Object>, Set<Never>);
  Expect.notEquals(Set<Object>, Set<Object?>);
  Expect.notEquals(Set<Object>, Set<void>);

  Expect.notEquals(Set<Object?>, Set<dynamic>);
  Expect.notEquals(Set<Object?>, Set<Null>);
  Expect.notEquals(Set<Object?>, Set<Never>);
  Expect.notEquals(Set<Object?>, Set<Object>);
  Expect.notEquals(Set<Object?>, Set<void>);

  Expect.notEquals(Set<void>, Set<dynamic>);
  Expect.notEquals(Set<void>, Set<Null>);
  Expect.notEquals(Set<void>, Set<Never>);
  Expect.notEquals(Set<void>, Set<Object>);
  Expect.notEquals(Set<void>, Set<Object?>);

  testXExtendsNever();
}
