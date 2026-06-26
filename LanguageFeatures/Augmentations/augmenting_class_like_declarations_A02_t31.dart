// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that an augment of a enum may specify a `with` clause
/// and interface members are implemented as expected.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

StringBuffer log = StringBuffer();

mixin M1 {
  String get g => 'M1';
  String m() => 'M1';
  void set s(String v) {
    log.write('$v;');
  }
}

mixin M2 on M1 {
  String get g => '${super.g} and M2';
  String m() => '${super.m()} and M2';
  void set s(String v) {
    log.write('${super.s = v} and M2');
  }
}

enum E {
  e0;
}

augment enum E with M1 implements M2 {}

main() {
  Expect.equals('M1', E.e0.g);
  Expect.equals('M1', E.e0.m());
  E.e0.s = 'M1';
  Expect.equals('M1;', log.toString());
}
