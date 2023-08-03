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
/// @description Checks that it is a compile-time error if the type
/// `V<T1, .. Ts>` is not regular-bounded.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V<T extends V<T>>(T id) {}

main() {
  List<V> l = [];
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
