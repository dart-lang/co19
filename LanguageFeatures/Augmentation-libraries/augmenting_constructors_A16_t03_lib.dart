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
/// appropriate parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A16_t03.dart';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

augment class C {
  augment factory C.foo(int x, [int y = 0]) {
    augmented(0).expectStaticType<Exactly<C>>();
    Expect.equals(0, augmented(0).x);
    Expect.equals(0, augmented(0).y);
    Expect.equals(1, augmented(1, 1).x);
    Expect.equals(1, augmented(1, 1).y);
    return augmented(x + 1, y + 1);
  };

  augment factory C.bar(int x, {int y = 0}) {
    augmented(0).expectStaticType<Exactly<C>>();
    Expect.equals(0, augmented(0).x);
    Expect.equals(0, augmented(0).y);
    Expect.equals(1, augmented(1, y: 1).x);
    Expect.equals(1, augmented(1, y: 1).y);
    return augmented(x + 1, y: y + 1);
  };

  augment factory C.bar({required int x}) {
    augmented(x: 0).expectStaticType<Exactly<C>>();
    Expect.equals(0, augmented(x: 0).x);
    Expect.equals(0, augmented(x: 0).y);
    return augmented(x: x + 1);
  };
}

augment extension type ET {
  augment factory ET.foo(int x) {
    augmented(0).expectStaticType<Exactly<ET>>();
    Expect.equals(0, augmented(0).id);
    return augmented(x + 1);
  };

  augment factory ET.bar([int x]) {
    augmented().expectStaticType<Exactly<ET>>();
    Expect.equals(1, augmented(1).id);
    return augmented(x + 1);
  };

  augment factory ET.baz({int x}) {
    augmented().expectStaticType<Exactly<ET>>();
    Expect.equals(1, augmented(x: 1).id);
    return augmented(x: x + 1);
  };

  augment factory ET.qux({required int x}) {
    augmented(x: 0).expectStaticType<Exactly<ET>>();
    Expect.equals(1, augmented(x: 1).id);
    return augmented(x: x + 1);
  };
}
