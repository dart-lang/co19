// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional and optional parameters as the
///   augmented declaration.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For all corresponding pairs of parameters:
///   - They have the same type (if not omitted in the augmenting declaration).
///   - They have the same `required` and `covariant` modifiers.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if an augmentation with a
/// wildcard introduces a default value for optional positional parameter of a
/// primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../utils/expect.dart';

class C1([int x]) {
  int x;
  this: x = x;
}

augment class C1 {
  augment C1([int _ = 1]);
}

class C2([var int x]) {}

augment class C2 {
  augment C2([int _ = 1]);
}

enum E1([int x]) {
  e0;

  final int x;
  this: x = x;
}

augment enum E1 {
  ;
  augment const E1([int _ = 2]);
}

enum E2([final int x]) {
  e0;
}

augment enum E2 {
  ;
  augment const E2([int _ = 2]);
}
main() {
  Expect.equals(1, C1().x);
  Expect.equals(1, C2().x);
  Expect.equals(2, E1.e0.x);
  Expect.equals(2, E2.e0.x);
}
