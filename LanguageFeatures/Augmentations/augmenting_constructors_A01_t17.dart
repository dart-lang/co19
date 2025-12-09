// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if the name of a positional parameter was augmented
/// to `_` then it is a compile-time error to use an old name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C(int? x);
  C.foo([int? x]);
}

augment class C {
  augment C(int? _) {
    print(x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment C.foo([int? _]) {
    print(x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e0(1), e1.foo(1);

  const E(int? x);
  const E.foo([int? x]);
}

augment enum E {
  ;
  augment const E(int? _) : assert(x != null);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo([int? _]) : assert(x != null);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int? v) {
  ET.foo(int? x);
  ET.bar([int? x]);
}

augment extension type ET {
  augment ET.foo(int? _) {
    print(x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment ET.bar([int? _]) {
    print(x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(E);
  print(ET);
}
