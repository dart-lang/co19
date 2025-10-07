// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the declaring constructor is found in the
/// following steps, where `D` is the class, extension type, or enum declaration
/// in the program that includes a declaring constructor `k`, and `D2` is the
/// result of the derivation of the semantics of `D`. The derivation step will
/// delete elements that amount to the declaring constructor. Semantically, it
/// will add a new constructor `k2`, and it will add zero or more instance
/// variable declarations.
/// ...
/// An initializing formal parameter (e.g., `T this.x`) is copied from `L` to
/// `L2`, along with the default value, if any, and is otherwise unchanged.
///
/// @description Check that initializing formal parameter of a declaring
/// constructor initializes appropriate instance variable and preserves the
/// default value. Test required parameters.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

class C1<T>(this.v1, T this.v2) {
  String v1;
  T v2;
}

class C2(String this.v1, int this.v2) {
  String v1;
  int v2;
}

class C3<T> {
  String v1;
  T v2;
  this(this.v1, T this.v2);
}

class C4 {
  String v1;
  int v2;
  this(String this.v1, this.v2);
}

enum E1<T>(T this.v1) {
  e0<String>("v1");
  final T v1;
}
enum E2(this.v1) {
  e0("v1");
  final String v1;
}

enum E3<T> {
  e0<String>("v1");
  final T v1;
  const this(this.v1);
}

enum E4 {
  e0("v1");
  final String v1;
  const this(String this.v1);
}

main() {
  var c1 = C1<int>("v1", 2);
  Expect.equals("v1", c1.v1);
  Expect.equals(2, c1.v2);

  var c2 = C2("v1", 2);
  Expect.equals("v1", c2.v1);
  Expect.equals(2, c2.v2);

  var c3 = C3<int>("v1", 2);
  Expect.equals("v1", c3.v1);
  Expect.equals(2, c3.v2);

  var c4 = C4("v1", 2);
  Expect.equals("v1", c4.v1);
  Expect.equals(2, c4.v2);

  Expect.equals("v1", E1.e0.v1);
  Expect.equals("v1", E2.e0.v1);
  Expect.equals("v1", E3.e0.v1);
  Expect.equals("v1", E4.e0.v1);
}
