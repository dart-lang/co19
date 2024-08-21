// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting factory constructor marked `augment` works in
/// the same way as a normal function augmentation.
/// If it has a body, it replaces the body of the augmented constructor
/// (if present), and it may invoke the augmented body by calling
/// `augmented(arguments)`.
///
/// @description Checks that `augmented(arguments)` in the body of augmenting
/// non-redirecting factory constructor calls the introductory constructor with
/// `arguments` as the actual arguments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A16_t03.dart';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

augment class C {
  augment factory C.foo(int x, [int y = 0]) {
    // Note that for factory constructors every call of `augmented()` creates
    // a new object. Let's not create too many of them.
    var c1 = augmented(0);
    c1.expectStaticType<Exactly<C>>();
    Expect.equals(0, c1.x);
    Expect.equals(0, c1.y);
    var c2 = augmented(1, 1);
    Expect.equals(1, c2.x);
    Expect.equals(1, c2.y);
    return augmented(x + 1, y + 1);
  }

  augment factory C.bar(int x, {int y = 0}) {
    var c1 = augmented(0);
    c1.expectStaticType<Exactly<C>>();
    Expect.equals(0, c1.x);
    Expect.equals(0, c1.y);
    var c2 = augmented(1, y: 1);
    Expect.equals(1, c2.x);
    Expect.equals(1, c2.y);
    return augmented(x + 1, y: y + 1);
  }

  augment factory C.bar({required int x}) {
    var c1 = augmented(x: 0);
    c1.expectStaticType<Exactly<C>>();
    Expect.equals(0, c1.x);
    Expect.equals(0, c1.y);
    return augmented(x: x + 1);
  }
}

augment extension type ET {
  augment factory ET.foo(int x) {
    var et1 = augmented(0);
    et1.expectStaticType<Exactly<ET>>();
    Expect.equals(0, et11.id);
    return augmented(x + 1);
  }

  augment factory ET.bar([int x]) {
    var et1 = augmented(1);
    et1.expectStaticType<Exactly<ET>>();
    Expect.equals(1, et1.id);
    return augmented(x + 1);
  }

  augment factory ET.baz({int x}) {
    var et1 = augmented(x: 1);
    et1.expectStaticType<Exactly<ET>>();
    Expect.equals(1, et1.id);
    return augmented(x: x + 1);
  }

  augment factory ET.qux({required int x}) {
    var et1 = augmented(x: 1);
    et1.expectStaticType<Exactly<ET>>();
    Expect.equals(1, et1.id);
    return augmented(x: x + 1);
  }
}
