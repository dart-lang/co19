// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, or mixin augmentation may specify
/// extends, implements, on, and with clauses (when generally supported). The
/// types in these clauses are appended to the original declarations clauses of
/// the same kind, and if that clause did not exist previously then it is added
/// with the new types. All regular rules apply after this appending process, so
/// you cannot have multiple extends on a class, or an on clause on an enum, etc
///
/// @description Checks that a class, extension type, mixin and enum augment may
/// specify `implements` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
import augment 'augmenting_types_A07_t01_lib.dart';

interface class I {
  String get id => "I";
}

class C {}

extension type ET(I _) {}

mixin M {}

enum E {
  e1;
}

class MA = Object with M;

main() {
  I c = C();
  I et = ET(I());
  I m = MA();
  I e = E.e1;
  Expect.equals("C", c.id);
  Expect.equals("I", et.id);
  Expect.equals("M", m.id);
  Expect.equals("E", e.id);
}
