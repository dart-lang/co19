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
/// compile-time error occurs if R is not a subtype of S.
///
/// @description Checks that it is not an error if an extension type has a
/// representation type `R` and a superinterface with a representation type `S`
/// and `R` is a subtype of `S`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

extension type V1<T>(T id1) {}

extension type V(int id) implements V1<num> {}

main() {
  V v = V(42);
  Expect.equals(42, v.id);
  Expect.equals(42, v.id1);
}
