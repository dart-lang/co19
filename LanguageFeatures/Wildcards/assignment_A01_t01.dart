// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The behavior of assignment expressions is unchanged. In a pattern
/// assignment, `_` is always a wildcard.
///
/// @description Checks that in a pattern assignment, `_` is always a wildcard
/// and does not assign an existing variable named `_`. Test various patterns.
/// A non-pattern assignment still assigns that variable.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

int _ = -1;

class C {
  final int x;
  final int y;
  C(this.x, this.y);
}

class W {
  int _ = -2;

  void test() {
    int a;
    (_, a) = (1, 2);
    Expect.equals(2, a);
    Expect.equals(-2, _);

    [_, a, _] = [3, 4, 5];
    Expect.equals(4, a);
    Expect.equals(-2, _);

    {"k": a, "m": _} = {"k": 6, "m": 7};
    Expect.equals(6, a);
    Expect.equals(-2, _);

    C(x: a, y: _) = C(8, 9);
    Expect.equals(8, a);
    Expect.equals(-2, _);

    ((_, a) && _) = (10, 11); // ignore: unnecessary_wildcard_pattern
    Expect.equals(11, a);
    Expect.equals(-2, _);

    _ = 12;
    Expect.equals(12, _);
  }
}

main() {
  int a;
  int x;
  var r = (0, 0);

  (_, a) = (1, 2);
  Expect.equals(2, a);
  Expect.equals(-1, _);

  (_, a, _) = (3, 4, 5);
  Expect.equals(4, a);
  Expect.equals(-1, _);

  (_,) = (6,);
  Expect.equals(-1, _);

  (a, n: _) = (7, n: 8);
  Expect.equals(7, a);
  Expect.equals(-1, _);

  (n: _, m: a) = (n: 9, m: 10);
  Expect.equals(10, a);
  Expect.equals(-1, _);

  (:a, _) = (a: 11, 12);
  Expect.equals(11, a);
  Expect.equals(-1, _);

  (_, _, _) = (1, 2, 3);
  Expect.equals(-1, _);

  [_, a] = [1, 2];
  Expect.equals(2, a);
  Expect.equals(-1, _);

  [_] = [1];
  Expect.equals(-1, _);

  <int>[a, _, _] = [3, 4, 5];
  Expect.equals(3, a);
  Expect.equals(-1, _);

  [a, ..._] = [6, 7, 8];
  Expect.equals(6, a);
  Expect.equals(-1, _);

  [_, ..._, a] = [9, 10, 11];
  Expect.equals(11, a);
  Expect.equals(-1, _);

  [a, ..., _] = [12, 13, 14];
  Expect.equals(12, a);
  Expect.equals(-1, _);

  {"k1": a, "k2": _} = {"k1": 1, "k2": 2};
  Expect.equals(1, a);
  Expect.equals(-1, _);

  <String, int>{"k1": _, "k2": a} = {"k1": 3, "k2": 4, "k3": 5};
  Expect.equals(4, a);
  Expect.equals(-1, _);

  C(x: a, y: _) = C(1, 2);
  Expect.equals(1, a);
  Expect.equals(-1, _);

  C(x: _, y: a) = C(3, 4);
  Expect.equals(4, a);
  Expect.equals(-1, _);

  C(x: _, y: _) = C(5, 6);
  Expect.equals(-1, _);

  C(:x, y: _) = C(7, 8);
  Expect.equals(7, x);
  Expect.equals(-1, _);

  ((_, a)) = (1, 2);
  Expect.equals(2, a);
  Expect.equals(-1, _);

  ((_, a) && r) = (3, 4);
  Expect.equals(4, a);
  Expect.equals(3, r.$1);
  Expect.equals(4, r.$2);
  Expect.equals(-1, _);

  ((a, _) && _) = (5, 6); // ignore: unnecessary_wildcard_pattern
  Expect.equals(5, a);
  Expect.equals(-1, _);

  (a, _ as num) = (1, 2); // ignore: unnecessary_cast_pattern
  Expect.equals(1, a);
  Expect.equals(-1, _);

  (_ as int) = 1; // ignore: unnecessary_cast_pattern
  Expect.equals(-1, _);

  (a, _!) = (1, 2); // ignore: unnecessary_null_assert_pattern
  Expect.equals(1, a);
  Expect.equals(-1, _);

  (_!) = 1; // ignore: unnecessary_null_assert_pattern
  Expect.equals(-1, _);

  [(_, a), _] = [(1, 2), (3, 4)];
  Expect.equals(2, a);
  Expect.equals(-1, _);

  dynamic badCast = (1, "s");
  Expect.throws(() {
    (a, _ as int) = badCast;
  });
  Expect.equals(-1, _);

  dynamic badNull = (1, null);
  Expect.throws(() {
    (a, _!) = badNull;
  });
  Expect.equals(-1, _);

  _ = 42;
  Expect.equals(42, _);

  W().test();
  Expect.equals(42, _);
}
