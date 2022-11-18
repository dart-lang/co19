// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion nullAssertPattern ::= primaryPattern '!'
///
/// A null-assert pattern is similar to a null-check pattern in that it permits
/// non-null values to flow through. But a null-assert throws if the matched
/// value is null. It lets you forcibly assert that you know a value shouldn't
/// be null, much like the corresponding ! null-assert expression.
///
/// @description Check null-assert pattern in a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(List<String?> list) {
  return switch (list) {
    case ['name', var name!] => name.substring(0);
    case ['answer', _!] => "answer";
    default => "default";
  };
}

main() {
  Expect.equals("Lily", test(['name', 'Lily']));
  Expect.equals("answer", test(['answer', '42']));
}
