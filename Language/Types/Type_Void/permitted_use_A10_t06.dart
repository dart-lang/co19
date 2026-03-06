// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules. In the rules, every type under consideration is a static type.
/// ...
/// - An actual parameter expression corresponding to a formal parameter whose
///   statically known type annotation is `void` may have type `void`. Usages of
///   that parameter in the body of the callee are statically expected to be
///   constrained by having type `void`. This rule also applies to the operators
///   `[]` and `[]=`. For example, `e1` and `e2` may have type `void` in an
///   expression of the form `e0[e1] = e2` when the parameters of the statically
///   known operator `[]=` both have type `void`. Finally, this rule also
///   applies to setters. For example, with an expression of the form `e1 = e2`
///   which denotes a setter invocation whose statically known parameter type is
///   `void`, `e2` may have type `void`.
///
/// @description Checks that operands of `[]` and `[]=` operators may have type
/// `void`.
/// @author sgrekhov22@gmail.com
/// @issue 62844

import '../../../Utils/expect.dart';

void getVoid(Object? o) => o;

void main() {
  var m = <void, int>{};
  void zero = getVoid(0);
  void one = getVoid(1);
  m[zero] = 0;
  m[one] = 1;
  Expect.equals(0, m[zero]);
  Expect.equals(1, m[one]);
}
