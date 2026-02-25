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
/// @description Checks that it is not an error if an augmentation of a primary
/// constructor uses a parameter whose type annotation uses an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts,primary-constructors

part of 'augmenting_constructors_A10_t28.dart';
import 'augmentation_libraries_lib.dart' as l;

augment class C1 {
  augment C1(l.AL? a);
}

augment class C2 {
  augment C2([l.AL? a]);
}

augment class C3 {
  augment C3({l.AL? a});
}

augment class C4 {
  augment C4({required l.AL? a});
}

augment enum E1 {
  ;
  augment const E1(l.AL? a);
}

augment enum E2 {
  ;
  augment const E2([l.AL? a]);
}

augment enum E3 {
  ;
  augment const E3({l.AL? a});
}

augment enum E4 {
  ;
  augment const E4({required l.AL? a});
}
