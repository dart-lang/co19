// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an extension type declaration named Name, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// Assume that an extension type declaration DV named Name has representation
/// type R, and that the extension type V1 with declaration DV1 is a
/// superinterface of DV (note that V1 may have some actual type arguments).
/// Assume that S is the instantiated representation type corresponding to V1. A
/// compile-time error occurs if R is is neither a subtype of S nor a subtype of
/// V1.
///
/// @description Checks that it is a compile-time error if an extension type has
/// a representation type `R` and a superinterface with a representation type
/// `S` and `R` is neither a subtype of `S` nor a subtype of `V1`.
/// @author sgrekhov22@gmail.com
/// @issue 53170

extension type V1<T>(T id) {}

extension type V(num id) implements V1<String> {}
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(V1);
  print(V);
}
