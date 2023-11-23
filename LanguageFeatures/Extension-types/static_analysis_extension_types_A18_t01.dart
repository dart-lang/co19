// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let DV be an extension type declaration named Name with type
/// parameters X1 extends B1, .. Xs extends Bs. Assume that the representation
/// declaration of DV is (R id)
///
/// We then say that the declared representation type of Name is R, and the
/// instantiated representation type corresponding to Name<T1,.. Ts> is
/// [T1/X1, .. Ts/Xs]R.
/// ...
/// In the body of a member of an extension type declaration DV named Name and
/// declaring the type parameters X1, .. Xs, the static type of this is
/// Name<X1 .. Xs>. The static type of the representation name is the
/// representation type.
///
/// @description Checks that static type of `this` in an extension type
/// `Name<X1 .. Xs>` is `Name<X1 .. Xs>`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

extension type V1(int id) {
  test() {
    this.expectStaticType<Exactly<V1>>();
  }
}

extension type V2<T1, T2 extends num>(int id) {
  test() {
    this.expectStaticType<Exactly<V2<T1, T2>>>();
  }
}

main() {
  V1(42).test();
  V2(42).test();
  V2<String, num>(42).test();
  V2<int, int>(42).test();
}
