// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// parenthesizedPattern ::= '(' pattern ')'
/// Like parenthesized expressions, parentheses in a pattern let you control
/// pattern precedence and insert a lower precedence pattern where a higher
/// precedence one is expected.
///
/// @description Checks parentheses in a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(int value) =>
  switch(value) {
    ((> 0 || == 0) && < 42) => "[0, 42)",
    > 42 && (== 100 || < 100) => "(42, 100]",
    _ => "default"
  };

main() {
  Expect.equals("[0, 42)", test(0));
  Expect.equals("[0, 42)", test(1));
  Expect.equals("[0, 42)", test(41));
  Expect.equals("default", test(42));
  Expect.equals("(42, 100]", test(43));
  Expect.equals("(42, 100]", test(99));
  Expect.equals("(42, 100]", test(100));
  Expect.equals("default", test(101));
}
