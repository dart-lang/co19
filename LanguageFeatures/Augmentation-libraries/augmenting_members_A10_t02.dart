// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An `external` variable is augmented with an abstract variable.
///
/// @description Checks that that it is not an error if an `external` variable
/// is augmented with an abstract getter or setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A10_t02_lib.dart';

abstract class C1 {
  external int externalVariable;
}

abstract class C2 {
  external int externalVariable;
}

main() {
  print(C1);
  print(C2);
}
