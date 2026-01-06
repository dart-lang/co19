// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that an augment of a class or enum may specify an
/// additional `with` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
part 'augmenting_types_A09_t02_lib.dart';

mixin M1 {
  String get id1 => "M1";
}

mixin M2 {
  String get id2 => "M2";
}

class C with M1 {}

augment class C with M2 {}

enum E with M1 {e1;}

augment enum E with M2 {
  ;
}

main() {
  Expect.equals("M1", C().id1);
  Expect.equals("M1", E.e1.id1);
  Expect.equals("M2", C().id2);
  Expect.equals("M2", E.e1.id2);
}
