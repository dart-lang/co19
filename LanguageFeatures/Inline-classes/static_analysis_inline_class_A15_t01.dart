// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The inline erasure of an inline type V is obtained by recursively
/// replacing every subterm of V which is an inline type by the corresponding
/// representation type.
///
/// Let X1 extends B1, .. Xs extends Bs be a declaration of the type parameters
/// of a generic entity (it could be a generic class, inline or not, or mixin,
/// or typedef, or function). Let BBj be the inline erasure of Bj, for j in
/// 1 .. s. It is a compile-time error if X1 extends BB1, .. Xs extends BBs has
/// any compile-time errors.
///
/// @description Checks that if `BBj` is the inline erasure of `Bj`, for `j` in
/// `1 .. s`, then it is a compile-time error if
/// `X1 extends BB1, .. Xs extends BBs` has any compile-time errors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V<T> {
  final T id;
  V(this.id);
}

void foo<X extends V<Y>, Y extends X>() {} // foo<X extends Y, Y extends X>()
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(foo);
}
