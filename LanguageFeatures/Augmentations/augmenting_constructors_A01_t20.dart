// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if a positional parameter whose
/// name is not `_` is accessed in the body even if any of prior augmentations
/// use `_` as its name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../utils/expect.dart';

String log = "";

class C {
  C(int _);
  C.foo([int? _]);
}

augment class C {
  augment C(int x);
  augment C.foo([int? _x]);
}

augment class C {
  augment C(int _);
  augment C.foo([int? _]);
}

augment class C {
  augment C(int x) {
    log = "$x";
  }
  augment C.foo([int? _x]) {
    log = "$_x";
  }
}

enum E {
  e0(1), e1.foo(1);

  const E(int _);
  const E.foo([int _]);
}

augment enum E {
  ;
  augment const E(int x);
  augment const E.foo([int x = 0]);
}

augment enum E {
  ;
  augment const E(int? _);
  augment const E.foo([int _]);
}

augment enum E {
  ;
  augment const E(int x) : assert(_x != null);
  augment const E.foo([int x]) : assert(_x != null);
}

extension type ET(int? v) {
  ET.foo(int _);
  ET.bar([int _]);
}

augment extension type ET {
  augment ET.foo(int x);
  augment ET.bar([int _x = 0]);
}

augment extension type ET {
  augment ET.foo(int _);
  augment ET.bar([int _]);
}

augment extension type ET {
  ET.foo(int x) : v = 0 {
    log = "$x";
  }
  ET.bar([int _x]) : v = 0 {
    log = "$_x";
  }
}

checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  C(1);
  checkLog("1");
  C.foo(2);
  checkLog("2");

  ET.foo(1);
  checkLog("1");
  ET.bar(2);
  checkLog("2");

  print(E);
}
