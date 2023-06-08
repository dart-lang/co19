// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an inline class declaration named Inline, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// Assume that an inline class declaration DV named Inline has representation
/// type R, and that the inline type V1 with declaration DV1 is a superinterface
/// of DV (note that V1 may have some actual type arguments). Assume that S is
/// the instantiated representation type corresponding to V1. A compile-time
/// error occurs if R is not a subtype of S.
///
/// @description Checks that it is a compile-time error if an inline class has
/// a representation type `R` and a superinterface with a representation type
/// `S` and `R` is not a subtype of `S`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V1 {
  final int id;
  V1(this.id);
}

inline class V implements V1 {
  final num id;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
  V(this.id);
}

main() {
  print(V1);
  print(V);
}
