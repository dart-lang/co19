// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let DV be an inline class declaration named Inline with type
/// parameters X1 extends B1, .. Xs extends Bs. Assume that DV declares a final
/// instance variable with name id and type R.
///
/// We say that the declared representation type of Inline is R, and the
/// instantiated representation type corresponding to Inline<T1,.. Ts> is
/// [T1/X1, .. Ts/Xs]R.
/// ...
/// In the body of a member of an inline class declaration DV named Inline and
/// declaring the type parameters X1, .. Xs, the static type of this is
/// Inline<X1 .. Xs>. The static type of the representation name is the
/// representation type.
///
/// @description Checks that static type of `this` in an inline class
/// `Inline<X1 .. Xs>` is `Inline<X1 .. Xs>`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class V1 {
  final int id;
  V1(this.id);

  test() {
    this.expectStaticType<Exactly<V1>>();
  }
}

inline class V2<T1, T2 extends num> {
  final int id;
  V2(this.id);

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
