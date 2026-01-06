// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that a class, mixin, enum and extension type
/// augmentation may specify an `implements` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

interface class I {
  String get id => "I";
}

class C {}

augment class C implements I {
  String get id => "C";
}

mixin M {}

augment mixin M implements I {
  String get id => "M";
}

enum E {
  e1;
}

augment enum E implements I {
  ;
  String get id => "E";
}

extension type ET(I v) {}

augment extension type ET implements I {
  String get id => "ET";
}

class MA = Object with M;

main() {
  I c = C();
  I m = MA();
  I e = E.e1;
  I et = ET(I());
  Expect.equals("C", c.id);
  Expect.equals("M", m.id);
  Expect.equals("E", e.id);
  Expect.equals("ET", et.id);
}
