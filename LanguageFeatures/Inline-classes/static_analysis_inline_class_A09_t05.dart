// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If e is an expression whose static type V is the extension type
/// Name<T1, .. Ts> and V has no member whose basename is the basename of m, a
/// member access like e.m(args) may be an extension member access, following
/// the normal rules about applicability and accessibility of extensions, in
/// particular that V must match the on-type of the extension
///
/// @description Checks that if a declaration named `m` is found in the body of
/// inline class then that invocation is treated as an invocation of the inline
/// member `m` on the receiver this according to its inline type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension E1 on int {
  String foo() => "E1.foo";
}

extension EV1 on V1 {
  String foo() => "EV1.foo";
}

extension EV2 on V2 {
  String foo() => "EV2.foo";
}

extension type V1(int it) {
  String foo() => "V1.foo";
  String baz() => "V1.baz";
  String qux() => "V1.qux";
}

String qux() => "qux";

extension type V2(int it) {
  String foo()  => "V2.foo";
  void test() {
    Expect.equals("V2.foo", foo());
    Expect.equals("V1.foo", it.foo());
    Expect.equals("V1.baz", it.baz());
    Expect.equals("E1.foo", 1.foo());
    Expect.equals("qux", qux());
  }
}

main() {
  V2 v2 = V2(V1(42));
  v2.test();
}
