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
/// Let V be an inline type of the form Inline<T1, .. Ts>, and let R be the
/// corresponding instantiated representation type. If R is non-nullable then V
/// is a proper subtype of Object, and V is non-nullable. Otherwise, V is a
/// proper subtype of Object?, and V is potentially nullable.
///
/// @description Checks that if an instantiated representation type `R` is
/// non-nullable then it is a compile-time error to assign `Object` to `V`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V1 {
  final int id;
  V1(this.id);
}

inline class V2<T1, T2 extends num?> {
  final T1 id;
  V2(this.id);
}

main() {
  V1 v1 = Object();
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2 v2_1 = Object();
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String, int> v2_2 = Object();
//                       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
