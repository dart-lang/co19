// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - Let `e` be an expression ending in a `⟨cascadeSection⟩` of the form
///   `.. S s = e1`, where `S` is of the form
///   `(⟨cascadeSelector⟩ ⟨argumentPart⟩*) (⟨assignableSelector⟩ ⟨argumentPart⟩*)*`
///   and `e1` is of the form `⟨expressionWithoutCascade⟩`.
///   If `s` is an `⟨assignableSelector⟩` of the form `.id` or `?.id` where the
///   static type of the identifier `id` is `void`, `e1` may have type `void`.
///   Otherwise, if `s` is an `⟨assignableSelector⟩` of the form `[ e0 ]` where
///   the static type of the first formal parameter in the statically known
///   declaration of operator `[]=` is `void`, `e0` may have type `void`. Also,
///   if the static type of the second formal parameter is `void`, `e1` may have
///   type `void`.
///
/// @description Checks that if in an expression ending in `.. S s = e1` where
/// `s` has the form `[ e0 ]` and the static typeof the first formal parameter
/// in the statically known declaration of operator `[]=` is `void`, then `e0`
/// may have type `void`.
/// @author sgrekhov22@gmail.com
/// @issue 57071

import '../../../Utils/expect.dart';

class C<X, Y> {
  Map<X, Y> m = <X, Y>{};
  C();
}

void main() {
  void v = 10;
  C<void, int> c = C<void, int>();
  c .. m[v] = 1;
  Expect.equals(1, c.m[10]);
}
