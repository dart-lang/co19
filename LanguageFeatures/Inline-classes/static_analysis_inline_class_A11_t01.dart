// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If e is an expression whose static type V is the inline type
/// Inline<T1, .. Ts> and V has no member whose basename is the basename of m,
/// a member access like e.m(args) may be an extension member access, following
/// the normal rules about applicability and accessibility of extensions, in
/// particular that V must match the on-type of the extension.
///
/// @description Checks that if `V` has no member with the name `m`, but there
/// is an extension member `m` then it is invoked
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension Ex1 on V {
  String foo() => "Ex1.foo()";
}

extension Ex2 on int {
  String bar() => "Ex2.bar()";
}

inline class V {
  final int id;
  V(this.id);
}

main() {
  V v = V(42);
  Expect.equals("Ex1.foo()", v.foo());
  Expect.equals("Ex2.bar()", v.id.bar());
}
