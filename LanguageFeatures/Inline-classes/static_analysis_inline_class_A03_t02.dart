// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that T1, .. Ts are types, and V resolves to an inline
/// class declaration of the following form:
///
/// inline class V<X1 extends B1, .. Xs extends Bs> ... {
///   final T id;
///   V(this.id);
///
///   ... // Other members.
/// }
/// ...
/// A compile-time error occurs if the type V<T1, .. Ts> is not regular-bounded.
///
/// @description Checks that it is a compile-time error if the type
/// `V<T1, .. Ts>` is not regular-bounded.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V<T extends V<T>> {
  final T id;
  V(this.id);
}

main() {
  List<V> l = [];
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
