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
/// @description Checks that it is not an error to call a member of an extension
/// type with a nullable representation type
/// @author sgrekhov22@gmail.com
/// @issue 53822

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int? _) {
  foo() {}
}

extension type ET2<T>(T _) {
  foo() {}
}

main() {
  ET1(42).foo();
  ET2<int?>(42).foo();
  ET2<Null>(null).foo();
}
