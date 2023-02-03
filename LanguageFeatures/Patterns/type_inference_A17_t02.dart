// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Identifier:
///
/// In an assignment context, the required type of p is the (unpromoted) static
/// type of the variable that p resolves to.
///
/// In a matching context, the name refers to a constant. Type check the
/// constant identifier expression in context type M.
///
/// In a declaration context, the required type of p is M, as is the static type
/// of the variable introduced by p.
///
/// @description Check that in a matching identifier pattern is type checked in
/// context type M
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String log = "";

void logger(String toLog) {
  log += toLog;
}

void clearLog() {
  log = "";
}

class C<T> {
  final void Function(String s) _logFunction;
  final int id;
  const C(this._logFunction, this.id);

  @override
  bool operator ==(Object other) {
    _logFunction("$this == $other;");
    if (other is C) {
      return this.id == other.id;
    }
    return false;
  }

  @override
  String toString() {
    return "C<$T>($id)";
  }
}

class D extends C<List<num>> {
  const D(super._logFunction, super.id);

  @override
  String toString() {
    return "D($id)";
  }
}

const one = C(logger, 1);

String test1(D d) {
  switch (d) {
    case one:
      return "match";
    default:
      return "no match";
  }
}

String test2(D d) {
  if (d case one) {
    return "match";
  }
  return "no match";
}

String test3(D d) =>
  switch (d) {
    const one => "match",
    _ => "no match"
  };

main() {
  D d = D(logger, 1);
  test1(d);
  Expect.equals("C<List<int>>(1) == D(1)", log);
  clearLog();

  test2(d);
  Expect.equals("C<List<int>>(1) == D(1)", log);
  clearLog();

  test3(d);
  Expect.equals("C<List<int>>(1) == D(1)", log);
  clearLog();
}
