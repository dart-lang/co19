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
/// Let V be an extension type of the form Name<T1, .. Ts>, and let R be the
/// corresponding instantiated representation type. If R is non-nullable then V
/// is a proper subtype of Object, and V is non-nullable. Otherwise, V is a
/// proper subtype of Object?, and V is potentially nullable.
///
/// @description Checks that it is a compile-time error to have an instance
/// variable whose type is an extension type, and then relying on implicit
/// initialization to null.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int? it) {}

extension type V2<T1, T2 extends num?>(num? id) {}

test1<X extends V1?>() {
  X x;
  print(x); // Expect an error on the first use of non-initialized variable
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test2<X extends V2<String, int>?>() {
  X x;
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  V1 v1;
  print(v1);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  V2<String, int> v2;
  print(v2);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}
