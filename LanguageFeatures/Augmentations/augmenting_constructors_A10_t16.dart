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
/// constructor omits types of formal parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C1(int x, [int y = 0]) {
  var x, y;
  this: x = x, y = y;
}

augment class C1 {
  augment C1(x, [y]);
}

class C2({required int x, int y = 0}) {
  final x, y;
  this: x = x, y = y;
}

augment class C2 {
  augment C2({required x, y});
}

enum E1(int x, [int y = 0]) {
  e0(0), e1(1, 2);

  final x, y;
  this: x = x, y = y;
}

augment enum E1 {
  ;
  augment E1(x, [y]);
}

enum E2({required int x, int y = 0}) {
  e0(x: 1), e1(x: 1, y: 2);

  final x, y;
  this: x = x, y = y;
}

augment enum E2 {
  ;
  augment E2({required x, y});
}

main() {
  C1.new.expectStaticType<Exactly<C1 Function(int x, [int y])>>();
  C2.new.expectStaticType<Exactly<C2 Function({required int x, int y})>>();

  Expect.equals(1, C1(1).x);
  Expect.equals(0, C1(1).y);
  Expect.equals(1, C1(1, 2).x);
  Expect.equals(2, C1(1, 2).y);
  Expect.equals(1, C2(x: 1).x);
  Expect.equals(0, C2(x: 1).y);
  Expect.equals(1, C2(x: 1, y: 2).x);
  Expect.equals(2, C2(x: 1, y: 2).y);

  Expect.equals(1, E1.e0.x);
  Expect.equals(0, E1.e0.y);
  Expect.equals(1, E1.e1.x);
  Expect.equals(2, E1.e1.y);
  Expect.equals(1, E2.e0.x);
  Expect.equals(0, E2.e0.y);
  Expect.equals(1, E2.e1.x);
  Expect.equals(2, E2.e1.y);
}
