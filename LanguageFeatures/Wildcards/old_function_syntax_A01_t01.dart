// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
/// ...
/// Other declarations: top-level variables, top-level function names, type
/// names, member names, etc. are unchanged. They can be named `_` as they are
/// today.
/// ...
/// It is currently an error for a record field name to begin with `_`
/// (including just a bare `_`). We relax that error to only apply to record
/// fields whose name begins with `_` followed by at least one other character
/// (even if those later character(s) are `_`).
/// ...
/// A positional initializing formal named `_` does still initialize a field
/// named `_` (and you can still have a field with that name)
/// ...
/// Multiple `super._` and `this._` parameters can occur in the same
/// constructor without any name collision.
///
/// @description Checks wildcards in declarations which use the old function
/// type syntax: parameters and type parameters of type aliases, a type alias
/// named `_`, record types with positional fields named `_`, function-typed
/// parameters named `_` and function-typed initializing formals and super
/// parameters named `_`.
/// @author sgrekhov22@gmail.com

// @dart=3.15

import '../../Utils/expect.dart';

typedef int F1(_, int _);
typedef int F2(_, int _, [_, int _]);
typedef int F3<T>(T _, T _, [T? _, T? _]);
typedef int F4<_, _, _ extends num>();

typedef (int _,) R1();
typedef (int _, int _) R2();
typedef void R3((String _, {String s}) r);
typedef void R4((String _, int _) r);

typedef int _(String s);

int topLevelFunction(int _(), int _(int _, int _), [int _(_)?]) {
  // `_` is not bound by the parameters, so it denotes the type alias `_`.
  _ f = (String s) => 1;
  return f("");
}

class A {
  final _;
  A(this._(int _, int _));
}

class C extends A {
  final x;
  C(super._(int _, int _), this.x(int _));

  int instanceMethod(int _(), int _(int _, int _), {int named(int _)?}) => 2;
  static int staticMethod(int _(), int _(int _, int _), [int _(_)?]) => 3;
}

class D {
  final _;
  final int Function(int) y;
  D(this._(int _), int this.y(int _));
}

class E extends D {
  E(super._(int _), int super.y(int _));
}

main() {
  F1 f1 = (_, int _) => 1;
  F2 f2 = (_, int _, [dynamic _, int _ = 0]) => 2;
  F3<int> f3 = (int _, int _, [int? _, int? _]) => 3;
  Expect.equals(1, f1(1, 2));
  Expect.equals(2, f2(1, 2, 3, 4));
  Expect.equals(3, f3(1, 2, null, 4));
  print(F4);

  R1 r1 = () => (1,);
  Expect.equals(1, r1().$1);
  R2 r2 = () => (1, 2);
  Expect.equals(1, r2().$1);
  Expect.equals(2, r2().$2);
  R3 r3 = ((String _, {String s}) r) {
    Expect.equals("1", r.$1);
  };
  r3(("1", s: "s"));
  R4 r4 = ((String _, int _) r) {
    Expect.equals("1", r.$1);
    Expect.equals(2, r.$2);
  };
  r4(("1", 2));

  _ f = (String s) => 42;
  Expect.equals(42, f(""));

  int localFunction(int _(), int _(int _, int _)) => 4;

  Expect.equals(1, topLevelFunction(() => 0, (_, _) => 0));
  Expect.equals(1, topLevelFunction(() => 0, (_, _) => 0, (_) => 0));
  var c = C((int x, int y) => x + y, (int x) => -x);
  Expect.equals(3, c._(1, 2));
  Expect.equals(-1, c.x(1));
  Expect.equals(2, c.instanceMethod(() => 0, (_, _) => 0));
  Expect.equals(3, C.staticMethod(() => 0, (_, _) => 0));
  Expect.equals(4, localFunction(() => 0, (_, _) => 0));
  var e = E((int x) => x + 1, (int x) => x + 2);
  Expect.equals(2, e._(1));
  Expect.equals(3, e.y(1));
}
