// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if matched type of a
/// switch expression is a sealed class and all cases are exhaustive
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

sealed class S<T> {}

mixin M<T> on S<T> {}

class C<T> extends S<T> {}

class F<T> implements M<T> {}

class MS = S<int> with M<int>;

String test1(S<int> s) => switch (s) { C<int> _ => "C", F<int> _ => "F", M<int> _ => "M" };

String test2(S<int> s) => switch (s) { C<num>() => "C", F<num>() => "F", M<num>() => "M" };

void main() {
  String v1 = test1(C<int>());
  Expect.equals("C", v1);

  String v2 = test2(C<int>());
  Expect.equals("C", v2);

  String v3 = test1(MS());
  Expect.equals("M", v3);

  String v4 = test2(MS());
  Expect.equals("M", v4);

  String v5 = test1(F<int>());
  Expect.equals("F", v5);

  String v6 = test2(F<int>());
  Expect.equals("F", v6);
}
