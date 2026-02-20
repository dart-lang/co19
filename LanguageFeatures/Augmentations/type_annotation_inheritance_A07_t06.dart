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
/// @description Checks that it is not an error if an introductory declaration
/// gets the return type of a function via override inference but an
/// augmentation specifies it explicitly.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

abstract class A {
  int foo();
}

class C implements A {
  foo();
}

augment class C {
  augment int foo() => 42;
}

main() {
  Expect.equals(42, C().foo());
  C().foo.expectStaticType<Exactly<int Function()>>();
}
