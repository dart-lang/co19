// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Functions include function declarations, methods, getters,
/// setters, constructors and function literals.
/// All functions have a signature and a body.
/// functionSignature:
///   metadata returnType? identifier formalParameterList
/// ;
/// returnType: void | type
/// ;
/// functionBody:
///   async? '=>' expression ';' | (async | async* | sync*)? block
/// ;
/// block:
///   '{' statements '}'
/// ;
///
/// @description Checks that returnType is optional
///
/// @author msyabro

import "../../Utils/expect.dart";

func(int x) => x + x + 1;
proc() {}

class A {
  f() { return () { return 20; }; }
  g(int arg) { return arg + arg; }
  h(int arg) => f()() + g(arg);
}

main() {
  f() {}
  g() => 1;

  // now call every function to force the compiler to parse it
  Expect.equals(5, func(2));
  proc();
  Expect.equals(20, new A().f()());
  Expect.equals(10, new A().g(5));
  Expect.equals(22, new A().h(1));
  f();
  Expect.equals(1, g());
}
