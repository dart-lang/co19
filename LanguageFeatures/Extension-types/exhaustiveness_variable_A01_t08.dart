// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a some class as a matched
/// type are always exhaustive if the set of cases is exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch statement is an extension type with some class as a
/// representation type and the set of cases is an exhaustive set of variable
/// patterns
/// @author sgrekhov22@gmail.com
/// @issue 54444

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

class A {}

class B extends A {}

class C extends B {}

extension type BET1(B _) {}
extension type BET2(B _) implements B {}

String test1(BET1 b) {
  switch (b) {
    case B _: return 'B';
  }
}

String test2(BET2 b) {
  switch (b) {
    case B _: return 'B';
  }
}

main() {
  Expect.equals("B", test1(BET1(B())));
  Expect.equals("B", test1(BET1(C())));
  Expect.equals("B", test2(BET2(B())));
  Expect.equals("B", test2(BET2(C())));
}
