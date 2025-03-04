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
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

testXExtendsT1<X extends Never>() {
  Expect.identical(X, Never); // NORM(X extends T) = Never if T is Never
}

testXExtendsT2<X extends Y, Y extends Never>() {
  // NORM(X extends T) = Never if T is a type variable Y and NORM(Y) is Never
  Expect.identical(X, Never);
}

main() {
  testXExtendsT1();
  testXExtendsT2();
}
