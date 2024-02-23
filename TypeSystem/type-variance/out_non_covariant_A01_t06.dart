// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be the declaration of a class or mixin, enum or a type
/// extension and let `X` be a type parameter declared by `D`.
///
/// If `X` has the variance modifier `out` then it is a compile-time error for
/// `X` to occur in a non-covariant position in a member signature in the body
/// of `D`, except that it is not an error if it occurs in a covariant position
/// in the type annotation of a formal parameter which is covariant (this is a
/// contravariant position in the member signature as a whole).
///
/// In particular, `X` can not be the type of a method parameter (unless it is
/// covariant). It can never be the bound of a type parameter of a generic
/// method
///
/// @description Check that it is a compile-time error if a type parameter has a
/// variance modifier `out` and occurs in a contravariant position in a member
/// signature in the body of `D` (it occurs in a contravariant position in a
/// `FutureOr<U>` type).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance,inline-class

import 'dart:async';

typedef ContrvariantT<T> = void Function(T);

class C<out X> {
  final FutureOr<ContrvariantT<X>>? v = null;
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<ContrvariantT<X>>? f() {}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<ContrvariantT<X>>? get g => null;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M<out X> {
  FutureOr<ContrvariantT<X>>? f() {}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<ContrvariantT<X>>? get g => null;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E<out X> {
  e;

  FutureOr<ContrvariantT<X>>? f() {}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<ContrvariantT<X>>? get g => null;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET<out X>(X x) {
  FutureOr<ContrvariantT<X>>? f() {}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<ContrvariantT<X>>? get g => null;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
