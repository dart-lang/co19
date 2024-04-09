// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an extension type declaration named Name, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// Assume that DV has two direct or indirect superinterfaces of the form
/// W<T1, .. Tk> respectively W<S1, .. Sk>. A compile-time error occurs if Tj is
/// not equal to Sj for any j in 1 .. k. The notion of equality used here is the
/// same as with the corresponding rule about superinterfaces of classes.
///
/// @description Checks that it is a compile-time error if an extension type has
/// two superinterfaces of the form `W<T1, .. Tk>`, `W<S1, .. Sk>` and there is
/// a `j` such that `Tj` is not equal to `Sj`.
/// @author sgrekhov22@gmail.com

extension type A<T>(T _) {}

extension type ET1(A<Never> _) implements A<A<int>> {}

extension type ET2(A<Never> _) implements ET1, A<A<String>> {}
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
main() {
  print(ET2);
}
