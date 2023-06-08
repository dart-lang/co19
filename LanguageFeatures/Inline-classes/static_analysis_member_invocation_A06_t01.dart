// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an inline class declaration DV has a member named n
/// in the case where DV declares a member named n, and in the case where DV has
/// no such declaration, but DV has a direct superinterface V that has a member
/// named n. In both cases, the member declaration named n that DV has is said
/// declaration.
///
/// @description Checks that if inline class `V` has a superinterface with a
/// member `m` then this member is also presents in `V`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V1 {
  final int id;
  V1(this.id);

  void m1() {}
  int get m2 => 42;
  void set m3(int val) {}
}

inline class V implements V1 {
  final int id;
  V(this.id);
}

main() {
  V v = V(42);
  v.m1();
  v.m2;
  v.m3 = 42;
}
