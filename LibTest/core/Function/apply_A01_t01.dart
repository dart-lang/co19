// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion dynamic apply(Function function, List positionalArguments,
/// [Map<Symbol, dynamic> namedArguments])
/// Dynamically call function with the specified arguments.
/// Acts the same as calling function with positional arguments corresponding
/// to the elements of positionalArguments and named arguments corresponding
/// to the elements of namedArguments.
/// @description Checks that invoking a Function object via Function.apply
/// produces expected results.
/// @author rodionov

import "../../../Utils/expect.dart";

class A {
  String call(int x, int y) {
    return "$x$y";
  }
}

class B extends A {}

String foo(x1, y1, {x2 = "x2", y2}) {
  return "$x1$y1$x2$y2";
}

main() {
  Expect.equals("12", Function.apply(new A(), [1, 2], null));
  Expect.equals("1122", Function.apply(new B(), [11, 22], null));
  
  Map<Symbol, dynamic> namedArgs = new Map();
  namedArgs[const Symbol("y2")] = 22;
  Expect.equals("x1y1x222", Function.apply(foo, ["x1", "y1"], namedArgs));

  namedArgs[const Symbol("x2")] = "x3";
  namedArgs[const Symbol("y2")] = "y3";
  Expect.equals("x1y1x3y3", Function.apply(foo, ["x1", "y1"], namedArgs));
}
