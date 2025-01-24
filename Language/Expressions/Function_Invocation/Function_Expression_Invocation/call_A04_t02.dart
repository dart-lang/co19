// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a runtime error to implicitly invoke a
/// `.call()` method on a type which has a `call` getter only.
/// @author sgrekhov22@gmail.com
/// @author lrhn
/// @issue 59965

// See https://github.com/dart-lang/sdk/issues/55803#issuecomment-2124182059

import '../../../../Utils/expect.dart';

void main() {
  // These dynamic invocations should fail at runtime
  // (dynamic invocation with `call` getter).
  Expect.throws(() {
    (BC() as dynamic)(42);
  }, null, "BC as dynamic did not throw");
  Expect.throws(() {
    (BMC() as dynamic)(42);
  }, null, "BM as dynamic did not throw");
  Expect.throws(() {
    (BE.instance as dynamic)(42);
  }, null, "BE as dynamic did not throw");
  Expect.throws(() {
    (rec as dynamic)(42);
  }, null, "Record as dynamic did not throw");
}

int foo(int x) => x;


// "Bad" types, no `call` method, only a call getter.
class BC {
  int Function(int) get call => foo;
}

mixin BM {
  int Function(int) get call => foo;
}
class BMC = Object with BM;

enum BE {
  instance;

  int Function(int) get call => foo;
}

({int Function(int) call}) rec = (call: foo);
