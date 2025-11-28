// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @assertion It's a compile-time error if:
/// - A declaration inside an augmenting enum declaration has the name `values`,
///   `index`, `hashCode`, or `==`.
///
/// @description Checks that it is not an error to declare or augment `name`
/// member or property.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

enum E1 {
  e0;
}

augment enum E1 {
  ;
  String get name => "name";
}

enum E2 {
  e0;
  String get name => "name1";
}

augment enum E2 {
  ;
  augment String get name => "name2";
}

enum E3 {
  e0;
}

augment enum E3 {
  name;
}

main() {
  Expect.equals("name", E1.e0.name);
  Expect.equals("name2", E2.e0.name);
  Expect.equals("e0", EnumName(E1.e0).name);
  Expect.equals("e0", EnumName(E2.e0).name);
  Expect.equals("E3.name", E3.name);
}
