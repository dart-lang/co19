// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may omit type annotations for a return
/// type, variable type, parameter type, or type parameter bound. In the last
/// case, that includes omitting the `extends` keyword. For a variable, a `var`
/// keyword replaces the type if the variable isn't `final`.
///
/// If a type annotation or type parameter bound is omitted in the augmenting
/// declaration, it is inferred to be the same as the corresponding type
/// annotation or type parameter bound in the declaration being augmented.
///
/// @description Checks that it is not an error if an augmentation omits the
/// type of an augmenting getter/variable. Test the case when the type is
/// obtained via override inference.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

abstract class A {
  int get foo;
  int get bar;
  abstract final int baz;
  abstract final int qux;
}

class C implements A {
  get foo;
  get bar;
  abstract final baz;
  abstract final qux;
}

augment class C {
  augment get foo;
  augment final bar;
  augment get baz;
  augment final qux;
}

augment class C {
  augment get foo => 1;
  augment final bar = 2;
  augment get baz => 3;
  augment final qux = 4;
}

main() {
  C().foo.expectStaticType<Exactly<int>>();
  C().bar.expectStaticType<Exactly<int>>();
  C().baz.expectStaticType<Exactly<int>>();
  C().qux.expectStaticType<Exactly<int>>();
  Expect.equals(1, C().foo);
  Expect.equals(2, C().bar);
  Expect.equals(3, C().baz);
  Expect.equals(4, C().qux);
}
