// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is not an error if a constructor augmentation
/// reorders named parameters of the original primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C({this.x = 0, this.y = 0}) {
  int x, y;
}

augment class C {
  augment C({int y, int x});
}

enum E({this.x = 0, this.y = 0}) {
  e0(x: 1, y: 2);

  final int x, y;
}

augment enum E {
  ;
  augment const E({int y, int x});
}

main() {
  var c = C(x: 1, y: 2);
  Expect.equals(1, c.x);
  Expect.equals(2, c.y);
  Expect.equals(1, E.e0.x);
  Expect.equals(2, E.e0.y);
}
