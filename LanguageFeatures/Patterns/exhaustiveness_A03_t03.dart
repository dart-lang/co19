// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the cases in a switch expression
/// are not exhaustive
///
/// @description Check that it is no compile-time error if the cases in a switch
/// expression are exhaustive. Test a matched type which is not an
/// always-exhaustive type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(List<bool> l) => switch (l) {
  [] => "case-0",
  [true, ...] => "case-1",
  [false, ...] => "case-2"
};

main() {
  Expect.equals("case-0", test([]));
  Expect.equals("case-1", test([true]));
  Expect.equals("case-1", test([true, false]));
  Expect.equals("case-2", test([false]));
  Expect.equals("case-2", test([false, false]));
}
