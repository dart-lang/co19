// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a non-redirecting generative constructor with, implicit
/// or explicit, super-constructor invocation s at the end of its initializer
/// list. Let D be the superclass constructor targeted by s (which must exist).
///
/// We define the associated super-constructor parameter for each
/// super-parameter p of C as follows:
///
/// If p is a positional parameter, let j be the number of positional
/// super-parameters of C up to and including p in source order. The associated
/// super-constructor parameter of p is the jth positional parameter of D
/// (1-based), if D has that many positional parameters.
/// If p is a named parameter with name n, the associated super-constructor
/// parameter is the named parameter of D with name n, if D has a named
/// parameter with that name.
///
/// It’s a compile-time error if a non-redirecting generative
/// constructor has a super-parameter with no associated super-constructor
/// parameter.
///
/// @description Check that for positional super parameters parameter associated
/// super constructor parameter is chosen by order not by name
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

import "../../Utils/expect.dart";

class S {
  int s1;
  S([int x1 = 0]) : s1 = x1;
}

class C extends S {
  int i1;
  int i2;
  C(this.i1, super.s1, int x) : this.i2 = x;
}

main() {
  Expect.equals(2, C(1, 2, 3).s1);
}
