// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is not an error if the name of a positional
/// parameter of an augmenting constructor is `_` and the name of this parameter
/// in the original constructor is not `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int? x;
  C(int? x);
  C.foo([this.x]);
}

augment class C {
  augment C(int? _);
  augment C.foo([int? _]);
}

enum E {
  e0(1), e1.foo(1);
  final int? x;
  const E(this.x);
  const E.foo([this.x]);
}

augment enum E {
  ;
  augment const E(int? _);
  augment const E.foo([int? _]);
}

extension type ET(int? x) {
  ET.foo(this.x);
  ET.bar([this.x]);
}

augment extension type ET {
  augment ET.foo(int? _);
  augment ET.bar([int? _]);
}

main() {
  Expect.isNull(C(1).x);
  Expect.isNull(C.foo(1).x);
  Expect.isNull(E.e0.x);
  Expect.isNull(E.e1.x);
  Expect.isNull(ET.foo(1).x);
  Expect.isNull(ET.bar(1).x);
}
