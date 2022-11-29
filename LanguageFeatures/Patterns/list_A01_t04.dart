// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// listPattern         ::= typeArguments? '[' listPatternElements? ']'
/// listPatternElements ::= listPatternElement ( ',' listPatternElement )* ','?
/// listPatternElement  ::= pattern | restPattern
/// restPattern         ::= '...' pattern?
///
/// A list pattern matches an object that implements List and extracts elements
/// by position from it.
///
/// It is a compile-time error if:
///
/// typeArguments is present and has more than one type argument.
///
/// There is more than one restPattern element in the list pattern. It can
/// appear anywhere in the list, but there can only be zero or one.
///
/// @description Checks a list pattern in a declaration context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  int val;
  C(this.val);
}

main() {
  var <Object>[a1, _, int c1] = [1, 2, 3];
  Expect.equals(1, a1);
  Expect.equals(3, c1);
  a1 = "4";
  c1 = 5;
  Expect.equals("4", a1);
  Expect.equals(5, c1);

  final [a2, int _, int c2] = [4, 5, 6];
  Expect.equals(4, a2);
  Expect.equals(6, c2);

  List<C> list = [C(1), C(2)];
  var <C>[a3, b3] = list;
  Expect.equals(1, a3.val);
  Expect.equals(2, b3.val);
  a3.val = 3;
  b3.val = 4;
  Expect.equals(3, list[0].val);
  Expect.equals(4, list[1].val);

  Expect.throws(() {
    var [a, b, c] = [1, 2];
  });
  Expect.throws(() {
    var [a, b, 42] = [1, 2, 3];
  });
  Expect.throws(() {
    var [a, b, c as String] = [1, 2, 3];
  });
  Expect.throws(() {
    var [a, b, c] = [1, 2, 3, 4];
  });
}
