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
/// @description Checks that it is not an error if an augmentation of a primary
/// constructor uses a parameter whose type annotation uses an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts,primary-constructors

import 'augmentation_libraries_lib.dart';
part 'augmenting_constructors_A10_t28_part.dart';

class C1(AL? a) {}
class C2([AL? a]) {}
class C3({AL? a}) {}
class C4({required AL? a}) {}

enum E1(AL? a) {
  e0(null);
}

enum E2([AL? a]) {
  e0;
}

enum E3({AL? a}) {
  e0;
}

enum E4({required AL? a}) {
  e0(a: null);
}

main() {
  C1(AL());
  C2(AL());
  C3(a: AL());
  C4(a: AL());

  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
