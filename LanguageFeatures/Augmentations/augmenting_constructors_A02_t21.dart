// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// It is a compile-time error if:
/// - The signature of an augmenting constructor does not match the signature of
///   the corresponding introductory declaration.
///
/// @description Checks that it is not an error if an augmentation with a
/// wildcard introduces a default value for optional positional parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x;
  C([this.x]);
}

augment class C {
  augment C([int _ = 1]);
}

enum E {
  e0();

  final int x;
  const E([this.x]);
}

augment enum E {
  ;
  augment const E([int _ = 2]);
}

extension type ET(int x) {
  ET.foo([this.x]);
}

augment extension type ET {
  augment ET.foo([int _ = 3]);
}

main() {
  Expect.equals(1, C().x);
  Expect.equals(2, E.e0.x);
  Expect.equals(3, ET.foo().x);
}
