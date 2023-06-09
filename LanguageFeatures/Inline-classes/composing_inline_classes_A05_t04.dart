// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an inline class declaration named Inline, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// A compile-time error occurs if an inline class declaration DV has two
/// superinterfaces V1 and V2, where both V1 and V2 have a member named m, and
/// the two declarations of m are distinct declarations, and DV does not declare
/// a member named m.
///
/// @description Checks that it is not an error if an inline class declaration
/// `DV` has two superinterfaces `V1` and `V2`, where both `V1` and `V2` have a
/// member named `m`, and the two declarations of `m` are distinct
/// declarations, but DV does declare a member named `m`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V1 {
  final int id;
  V1(this.id);

  int get m => 1;
}

inline class V2 {
  final int id;
  V2(this.id);

  num m() => 2;
}

inline class V implements V1, V2 {
  final int id;
  V(this.id);

  String get m => "42";
}

main() {
  V1 v1 = V(1);
  V2 v2 = V(2);
  V v = V(3);
  Expect.equals(1, v1.m);
  Expect.equals(2, v2.m());
  Expect.equals("42", v.m);
}
