// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`. or none of them have it.
/// ...
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if an augmentation with a
/// wildcard introduces a default value for optional positional parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../utils/expect.dart';

class C {
  int _;
  C([this._]);
}

augment class C {
  augment C([int _ = 1]);
}

enum E {
  e0();

  final int _;
  const E([this._]);
}

augment enum E {
  ;
  augment const E([int _ = 2]);
}

extension type ET(int _) {
  ET.foo([this._]);
}

augment extension type ET {
  augment ET.foo([int _ = 3]);
}

main() {
  Expect.equals(1, C()._);
  Expect.equals(2, E.e0._);
  Expect.equals(3, ET.foo()._);
}
