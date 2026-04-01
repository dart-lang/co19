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
/// - The return type (if not omitted) is the same as the introductory
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// In a declaration where a parameter named `n` is declared using `_`, the name
/// `n` is not in scope and may be resolved elsewhere.
///
/// @description Checks that in a declaration where a parameter named `n` is
/// declared using `_`, the name `n` is not in scope and may be resolved
/// elsewhere.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../utils/expect.dart';

int x = 42;

class C {
  int v;
  C(int x);
  C._([int _]) : v = x;
}

augment class C {
  augment C(int _) : v = x;
  augment C._([int x = 0]);
}

enum E {
  e0(0), e1._(), e2._(2);

  final int v;
  const E(int x);
  const E._([int _]) : v = x;
}

augment enum E {
  ;
  augment E(int _) : v = x;
  augment E._([int x = 0]);
}

extension type ET(int v) {
  ET.foo(int x);
  ET.bar([int _]) : v = x;
}

augment extension type ET {
  augment ET.foo(int _) : v = x;
  augment E.bar([int x = 0]);
}

main() {
  Expect.equals(42, C(1).v);
  Expect.equals(42, C._().v);
  Expect.equals(42, C._(1).v);
  Expect.equals(42, E.e0.v);
  Expect.equals(42, E.e1.v);
  Expect.equals(42, E.e2.v);
  Expect.equals(42, ET.foo(1).v);
  Expect.equals(42, ET.bar().v);
  Expect.equals(42, ET.bar(1).v);
}
