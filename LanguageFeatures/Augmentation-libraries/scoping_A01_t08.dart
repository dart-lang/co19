// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static and instance member namespaces for an augmented type
/// or extension declaration include the declarations of all members in the
/// introductory and augmenting declarations. Identifiers in the bodies of
/// members are resolved against that complete merged namespace. In other words,
/// augmentations are applied before identifiers inside members are resolved.
///
/// @description Checks that `name` is interpreted as `this.name` if it occurs
/// inside a scope where a `this` is available. Test a method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'scoping_A01_t08_lib.dart';

String foo() => "Global foo";
String bar() => "Global bar";

class C {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("Global foo", foo());
    Expect.equals("bar", bar());
    Expect.equals("Global baz", baz());
    Expect.equals("Global qux", qux());
  }
}

mixin M {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("Global foo", foo());
    Expect.equals("bar", bar());
    Expect.equals("Global baz", baz());
    Expect.equals("Global qux", qux());
  }
}

enum E {
  e0;
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("Global foo", foo());
    Expect.equals("bar", bar());
    Expect.equals("Global baz", baz());
    Expect.equals("Global qux", qux());
  }
}

class A {}

extension Ext on A {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("Global foo", foo());
    Expect.equals("bar", bar());
    Expect.equals("Global baz", baz());
    Expect.equals("Global qux", qux());
  }
}

extension type ET(String id) {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("Global foo", foo());
    Expect.equals("bar", bar());
    Expect.equals("Global baz", baz());
    Expect.equals("Global qux", qux());
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
