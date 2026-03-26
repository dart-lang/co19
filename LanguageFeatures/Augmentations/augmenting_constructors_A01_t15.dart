// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../Extension-types/syntax_A13_t03.dart';

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
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if the name of a positional
/// parameter in the original constructor is `_` and the name of this parameter
/// in an augmenting constructor is not `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int? x;
  C(int? _);
  C.foo([int? _]);
}

augment class C {
  augment C(this.x);
  augment C.foo([int? x]) : x = x;
}

enum E {
  e0(0), e1.foo(), e2.foo(2);

  final int x;
  const E(int _);
  const E.foo([int _]) : x = 1;
}

augment enum E {
  ;
  augment const E(this.x);
  augment const E.foo([int x]);
}

extension type ET(int? x) {
  ET.foo(int? _) : x = 1;
  ET.bar([int? _]);
}

augment extension type ET {
  augment ET.foo(this.x);
  augment ET.bar([int? x]) : x = x;
}

main() {
  Expect.equals(0, C(0).x);
  Expect.isNull(C.foo().x);
  Expect.equals(0, C.foo(0).x);
  Expect.equals(0, E.e0.x);
  Expect.equals(1, E.e1.x);
  Expect.equals(2, E.e2.x);
  Expect.equals(1, ET.foo(0).x);
  Expect.isNull(ET.bar().x);
  Expect.equals(0, ET.bar(0).x);
}
