// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function expression invocation i has the form
/// ef <A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k),
/// where ef is an expression.
/// ...
/// Let F be the static type of ef . If F is an interface type that has a method
/// named call, i is treated as the ordinary invocation
/// ef .call<A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k)
///
/// @description Checks that a function expression invocation ef(...) is indeed
/// equivalent to the ordinary method invocation ef.call(...) and that the
/// result in either case is the same as expected whether ef is a function
/// literal expression or some other kind of expression.
/// @author rodionov

import '../../../../Utils/expect.dart';

class C {
  call(x, [y = "foo"]) {
    return "call($x, $y)";
  }
}

main() {
  C c = new C();
  Expect.equals("call(1, foo)", c(1));
  Expect.equals("call(2, bar)", c(2, "bar"));
}
