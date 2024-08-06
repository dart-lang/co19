// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An `abstract` variable is augmented with a non-abstract variable, getter, or
/// setter.
///
/// @description Checks that that it is a compile-time error if an `abstract`
/// variable is augmented with a non-abstract variable, getter or setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A09_t01_lib.dart';

abstract class C1 {
  abstract String abstractVariable;
}

abstract class C2 {
  abstract String abstractVariable;
}

abstract class C3 {
  abstract String abstractVariable;
}

main() {
  print(C1);
  print(C2);
  print(C3);
}
