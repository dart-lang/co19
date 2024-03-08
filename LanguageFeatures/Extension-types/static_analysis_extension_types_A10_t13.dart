// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type has a
/// non-extension superinterface whose transitive alias expansion is a type
/// variable, a deferred type, any top type (including dynamic and void), the
/// type Null, any function type, the type Function, any record type, the type
/// Record, or any type of the form T? or FutureOr<T> for any type T.
///
/// @description Checks that it is not an error if an extension type has
/// `implements T` where `T` is an enumerated type
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

enum E {
  e1, e2, e3;

  int get eGetter => 0;
}

typedef EAlias = E;

extension type ET1(E id) implements E {}

extension type ET2(E id) implements EAlias {}

extension type ET3<T extends Enum>(T id) implements Enum {}

main() {
  ET1 et1 = ET1(E.e1);
  Expect.equals(E.e1, et1.id);
  Expect.equals(0, et1.eGetter);

  ET2 et2 = ET2(E.e2);
  Expect.equals(E.e2, et2.id);
  Expect.equals(0, et2.eGetter);

  ET3<E> et3 = ET3<E>(E.e3);
  Expect.equals(E.e3, et3.id);
  Expect.equals(0, et3.id.eGetter);
}
