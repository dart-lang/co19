// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// patternVariableDeclaration ::= ('final' | 'var') outerPattern '=' expression
///
/// outerPattern                ::= parenthesizedPattern
///                               | listPattern
///                               | mapPattern
///                               | recordPattern
///                               | objectPattern
///
/// @description Check valid variable declaration pattern. Test a list pattern
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  @Meta()
  var [a1, _] = [1, 2];
  Expect.equals(1, a1);
  a1 = 3;

  var [int a2, b2, ...List<int> c2] = [3, 4, 5, 6];
  Expect.equals(3, a2);
  Expect.equals(4, b2);
  Expect.listEquals([5, 6], c2);
  a2 = 5;
  b2 = 6;
  c2 = [];

  var <int>[a3, b3, ...c3] = [5, 6, 7, 8];
  Expect.equals(5, a3);
  Expect.equals(6, b3);
  Expect.listEquals([7, 8], c3);
  a3 = 7;
  b3 = 8;
  c3 = [];

  @Meta()
  final [_, b4] = [1, 2];
  Expect.equals(2, b4);

  final [int a5, b5, ...List<int> c5] = [3, 4, 5, 6];
  Expect.equals(3, a5);
  Expect.equals(4, b5);
  Expect.listEquals([5, 6], c5);

  final <int>[a6, b6, ...c6] = [5, 6, 7, 8];
  Expect.equals(5, a6);
  Expect.equals(6, b6);
  Expect.listEquals([7, 8], c6);
}
