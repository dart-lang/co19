// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Some enum members can not be augmented: It is a compile-time
/// error if an augmenting declaration in an enum declaration (introductory or
/// augmenting) has the name `values`, `index`, `hashCode`, or `==`.
///
/// @description Checks that it is not an error to declare or augment `name`
/// static member or property.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';

enum E1 {
  e0;
}

augment enum E1 {
  augment e0;
  static String get name => "name1";
}

enum E2 {
  e0;
  static String get name => "name";
}

augment enum E2 {
  augment e0;
  augment static String get name => "name2";
}

main() {
  Expect.equals("name1", E1.name);
  Expect.equals("e0", E1.e0.name);
  Expect.equals("name2", E2.name);
  Expect.equals("e0", E2.e0.name);
}
