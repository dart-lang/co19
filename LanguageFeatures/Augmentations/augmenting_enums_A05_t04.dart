// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An introductory `enum` declaration introduces implicit
/// introductory and complete declarations of:
/// - `int get index`
/// - `int get hashCode`
/// - `bool operator ==(Object)`
/// - `static const List<E> values;` where `E` is the enum type.
/// For ordering purposes, these implicit declarations are before any members
/// declared in the declaration.
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
  augment String get name;
}

enum E3 {
  e0;
}

augment enum E3 {
  name;
}

main() {
  Expect.equals("name", E1.e0.name);
  Expect.equals("name1", E2.e0.name);
  Expect.equals("e0", EnumName(E1.e0).name);
  Expect.equals("e0", EnumName(E2.e0).name);
  Expect.equals("E3.name", E3.name.toString());
}
