// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Constant: Type check the pattern's value in context type M.
///
/// @description Check that type argument may be inferred from a context type
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

class C<T1, T2> {
  final void Function(String s) _logFunction;
  const C(this._logFunction);

  @override
  bool operator ==(Object other) {
    _logFunction("$this == $other");
    if (other is C) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return "C<$T1, $T2>";
  }
}

class D extends C<int, List<num>> {
  const D(super._logFunction);

  @override
  String toString() {
    return "D";
  }
}

String test1(D d) {
  switch (d) {
    case const C(logger):
      return "match";
    default:
      return "no match";
  }
}

String test2(D d) {
  if (d case const C(logger)) {
    return "match";
  }
  return "no match";
}

String test3(D d) =>
  switch (d) {
    const C(logger) => "match",
    _ => "no match"
  };

main() {
  D d = D(logger);
  test1(d);
  Expect.equals("C<int, List<int>> == D", log);
  clearLog();

  test2(d);
  Expect.equals("C<int, List<int>> == D", log);
  clearLog();

  test3(d);
  Expect.equals("C<int, List<int>> == D", log);
  clearLog();
}
