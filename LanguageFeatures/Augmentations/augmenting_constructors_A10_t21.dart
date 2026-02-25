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
/// @description Checks that it is not an error if primary constructor declaring
/// parameters implicitly have type `dynamic` and the augmenting constructor
/// specifies it explicitly.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C1(var x) {}

augment class C1 {
  augment C1(dynamic x) {
    if (1 > 2) {
      x.checkDynamic;
    }
  }
}

class C2([final x]) {}

augment class C2 {
  augment C2([dynamic x]) {
    if (1 > 2) {
      x.checkDynamic;
    }
  }
}

class C3({var x}) {}

augment class C3 {
  augment C3({dynamic x}) {
    if (1 > 2) {
      x.checkDynamic;
    }
  }
}

class C4({required final x}) {}

augment class C4 {
  augment C4({required dynamic x}) {
    if (1 > 2) {
      x.checkDynamic;
    }
  }
}

enum E1(final x) {
  e0(0);
}

augment enum E1 {
  ;
  augment const E1(dynamic x);
}

enum E2([final x]) {
  e0;
}

augment enum E2 {
  ;
  augment const E2([dynamic x]);
}

enum E3({final x}) {
  e0;
}

augment enum E3 {
  ;
  augment const E3({dynamic x});
}

enum E4({required final x}) {
  e0(x: 1);
}

augment enum E4 {
  ;
  augment const E4({required dynamic x});
}

extension type ET(final x) {}

augment extension type ET {
  augment ET(dynamic x) {
    if (1 > 2) {
      x.checkDynamic;
    }
  }
}

main() {
  Expect.equals(1, C1(1).x);
  Expect.isNull(C2().x);
  Expect.equals(1, C2(1).x);
  Expect.isNull(C3().x);
  Expect.equals(1, C3(x: 1).x);
  Expect.equals(1, C4(x: 1).x);
  Expect.equals(0, E1.e0.x);
  Expect.isNull(E2.e0.x);
  Expect.isNull(E3.e0.x);
  Expect.equals(1, E4.e0.x);
  Expect.equals(42, ET(42).x);
}
