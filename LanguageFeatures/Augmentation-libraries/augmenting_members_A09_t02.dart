// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An `abstract` variable is augmented with a non-abstract variable.
///
/// @description Checks that that it is not an error if an `abstract` variable
/// is augmented with a non-abstract getter or setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A09_t02_lib.dart';
import '../../Utils/expect.dart';

abstract class C1 {
  abstract final String abstractVariable;
}

abstract class C2 {
  abstract String abstractVariable;
}

class D1 extends C1 {}
class D2 extends C2 {
  String get abstractVariable => "D2";
}

main() {
  Expect.equals("Augmented", D1().abstractVariable);
  D2().abstractVariable = "x";
  Expect.equals("x", _log);
}
