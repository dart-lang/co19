// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that an augment of a class may specify a `with` clause
/// and invocations of members of 'super' works as expected.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

StringBuffer log = StringBuffer();

class A {
  String v = 'M1';
  String get g => 'M1';
  String m() => 'M1';
  void set s(String v) {
    log.write('$v;');
  }
}

mixin M2 on A {
  late String v = '${super.v} and M2';
  String get g => '${super.g} and M2';
  String m() => '${super.m()} and M2';
  void set s(String v) {
    log.write('${super.s = v} and M2');
  }
}

class C extends A {}

augment class C with M2 {}

main() {
  Expect.equals('M1 and M2', C().v);
  Expect.equals('M1 and M2', C().g);
  Expect.equals('M1 and M2', C().m());
  C().s = 'M1';
  Expect.equals('M1;M1 and M2', log.toString());
}
