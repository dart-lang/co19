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
/// @description Check valid variable declaration pattern. Test a map pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  @Meta()
  var {"key1": a1, "key2": _} = {"key1": 1, "key2": 2};
  Expect.equals(1, a1);
  a1 = 42;

  var {"key1": int a2, "key2": b2} = {"key1": 3, "key2": 4};
  Expect.equals(3, a2);
  Expect.equals(4, b2);
  a2 = 42;
  b2 = 42;

  var <String, int>{"key1": int a3, "key2": b3}
      = {"key1": 5, "key2": 6, "key3": 7};
  Expect.equals(5, a3);
  Expect.equals(6, b3);
  a3 = 42;
  b3 = 42;

  @Meta()
  final {"key1": a4, "key2": _} = {"key1": 1, "key2": 2};
  Expect.equals(1, a4);

  final {"key1": int a5, "key2": b5} = {"key1": 3, "key2": 4};
  Expect.equals(3, a5);
  Expect.equals(4, b5);

  final <String, int>{"key1": int a6, "key2": b6}
      = {"key1": 5, "key2": 6, "key3": 7};
  Expect.equals(5, a6);
  Expect.equals(6, b6);
}
