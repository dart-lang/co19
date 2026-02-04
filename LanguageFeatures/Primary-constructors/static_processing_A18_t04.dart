// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// The formal parameter list `L2` of `k2` is identical to `L`, except that each
/// formal parameter is processed as follows.
/// ...
/// - An initializing formal parameter (e.g., `T this.x`) is copied from `L` to
///   `L2`, with no changes.
///
/// @description Check that an initializing formal parameter of a primary
/// constructor initializes the appropriate instance variable and preserves the
/// default value. Test required named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1<T>({required this.v1, required T? this.v2}) {
  String v1;
  T? v2;
}

class C2({required String this.v1, required this.v2}) {
  String v1;
  int v2;
}

enum E1<T>({required this.v1, required T this.v2}) {
  e0<int>(v1: "E1", v2: 2);
  final String v1;
  final T v2;
}

enum E2({required String this.v1, required this.v2}) {
  e0(v1: "E2", v2: 2);
  final String v1;
  final int v2;
}

main() {
  var c1 = C1<int>(v1: "C1", v2: 2);
  Expect.equals("C1", c1.v1);
  Expect.equals(2, c1.v2);

  var c2 = C2(v1: "C2", v2: 2);
  Expect.equals("C2", c2.v1);
  Expect.equals(2, c2.v2);

  Expect.equals("E1", E1.e0.v1);
  Expect.equals(2, E1.e0.v2);

  Expect.equals("E2", E2.e0.v1);
  Expect.equals(2, E2.e0.v2);
}
