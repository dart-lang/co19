// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that T1, .. Ts are types, and V resolves to an extension
/// type declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// ...
/// A compile-time error occurs if the type V<T1, .. Tk> provides a wrong number
/// of type arguments to V (when k is different from s), and if it is not
/// regular-bounded.
///
/// @description Checks that it is a compile-time error if an extension type
/// `V<T1, .. Ts>` has any dependency cycles in type bounds
/// @author sgrekhov22@gmail.com
/// @issue 54097

extension type V1<T extends T>(T id) {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified

extension type V2<T1 extends T2, T2 extends T1>(T1 id) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(V1<Never>);
  print(V2<Never, Never>);
}
