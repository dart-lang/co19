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
/// @description Checks that it is no an error if an inline class declaration
/// `DV` has superinterface `V` with member `m` and redeclares this member even
/// this is not a correct override for a regular class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

String log = "";

inline class V {
  final int id;
  V(this.id);

  int foo() => 0;
  int bar(num n) => 0;
  void set setter(num i) {
    log += "V.setter=";
  }
}

inline class C1 implements V {
  final int id;
  C1(this.id);

  num foo() => 1;
  int bar(int n) => 1;
  void set setter(int i) {
    log += "C1.setter=";
  }
}

inline class C2 implements V {
  final int id;
  C2(this.id);

  int get foo => 2;
  String get bar => "2";
  void set setter(String s) {
    log += "C2.setter=";
  }
}

main() {
  V v1 = C1(0);
  Expect.equals(0, v1.foo());
  Expect.equals(0, v1.bar(3.14));
  v1.setter = 1;
  Expect.equals("V.setter=", log);
  log = "";

  V v2 = C2(0);
  Expect.equals(0, v2.foo());
  Expect.equals(0, v2.bar(3.14));
  v2.setter = 1;
  Expect.equals("V.setter=", log);
  log = "";

  C1 c1 = C1(0);
  Expect.equals(1, c1.foo());
  Expect.equals(1, c1.bar(42));
  c1.setter = 1;
  Expect.equals("C1.setter=", log);
  log = "";

  C2 c2 = C2(0);
  Expect.equals(2, c2.foo);
  Expect.equals("2", c2.bar);
  c2.setter = "1";
  Expect.equals("C2.setter=", log);
  log = "";
}
