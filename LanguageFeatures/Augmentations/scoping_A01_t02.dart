// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static and instance member namespaces for an augmented type
/// or extension declaration include the declarations of all members in the
/// introductory and augmenting declarations. Identifiers in the bodies of
/// members are resolved against that complete merged namespace. In other words,
/// augmentations are applied before identifiers inside members are resolved.
///
/// @description Checks that it is possible to use `this.name` and
/// `TypeName.name` for referencing declarations in another introductory or
/// augmenting declaration. Test a getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'scoping_A01_t02_lib.dart';

String get foo => "Should not be used!";
String get bar => "Should not be used!";

class C {
  static String get foo => "foo";
  String get bar => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

mixin M {
  static String get foo => "foo";
  String get bar => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

enum E {
  e0;
  static String get foo => "foo";
  String get bar => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

class A {}

extension Ext on A {
  static String get foo => "foo";
  String get bar => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

extension type ET(String id) {
  static String get foo => "foo";
  String get bar => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

class MA = Object with M;

main() {
  C().testAugmenting();
  C().testIntroductory();
  MA().testAugmenting();
  MA().testIntroductory();
  E.e0.testAugmenting();
  E.e0.testIntroductory();
  A().testAugmenting();
  A().testIntroductory();
  ET("id").testAugmenting();
  ET("id").testIntroductory();
}
