// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// parenthesizedPattern ::= '(' pattern ')'
/// Like parenthesized expressions, parentheses in a pattern let you control
/// pattern precedence and insert a lower precedence pattern where a higher
/// precedence one is expected.
///
/// @description Checks parentheses in a variable pattern. Test the case when
/// there are no parentheses around expression on right side
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "patterns_lib.dart";

const empty = ();

main() {
  var (a) = 42;
  Expect.equals(42, a);
  (a) = 0;
  Expect.equals(0, a);

  final (b) = "42";
  Expect.equals("42", b);

  var (() c) = empty;
  Expect.equals(empty, c);
  (c) = ();
  (c) = (());

  final (() d) = empty;
  Expect.equals(empty, d);

  var (e) = [];
  Expect.isTrue(e.isEmpty);
  (e) = [42];
  Expect.equals(42, e[0]);

  final (List<int> f) = (<int>[42]);
  Expect.equals(42, f[0]);

  var (g) = {};
  Expect.isTrue(g.isEmpty);
  (g) = {1: "2"};
  Expect.equals("2", g[1]);

  final (Map<int, String> h) = <int, String>{2: "3"};
  Expect.equals("3", h[2]);

  var (Square(area: i)) = Square(1);
  Expect.equals(i, 1);
  (i) = Unit(42);
  Expect.equals(i, 42);

  final (Square(area: Unit j)) = Square(1);
  Expect.equals(j, 1);
}
