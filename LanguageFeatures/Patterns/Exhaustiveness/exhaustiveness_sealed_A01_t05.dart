// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression or statement is a sealed class and the set of
/// cases is exhaustive
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

sealed class S {}

mixin M on S {}

class C extends S {}

class F implements M {}

class MS = S with M;

String test1(S s) => switch (s) { C _ => "C", M _ => "M" };

String test2(S s) {
  switch (s) {
    case C _: return "C";
    case M _: return "M";
  }
}

void main() {
  String v1 = test1(C());
  Expect.equals("C", v1);

  String v2 = test1(MS());
  Expect.equals("M", v2);

  String v3 = test1(F());
  Expect.equals("M", v3);

  String v4 = test2(C());
  Expect.equals("C", v4);

  String v5 = test2(MS());
  Expect.equals("M", v5);

  String v6 = test2(F());
  Expect.equals("M", v6);
}
