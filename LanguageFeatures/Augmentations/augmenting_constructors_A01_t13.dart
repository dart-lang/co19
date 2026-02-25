// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is not an error if an introductory constructor
/// parameters implicitly have type `dynamic` and the augmenting constructor
/// specifies it explicitly.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String _log = "";

class C {
  var x, y;
  C(x, [y]);
  C.foo({required x, y});
  C.bar(x, [y]);
  C.baz({required x, y});
}

augment class C {
  augment C(dynamic this.x, [dynamic this.y]) {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
  }
  augment C.foo({required dynamic this.x, dynamic this.y}) {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
  }
  augment C.bar(dynamic x, [dynamic y]) : x = x, y = y {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
  }
  augment C.baz({required dynamic x, dynamic y}) : x = x, y = y {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
  }
}

enum E {
  e0(1), e1.foo(x: 1), e2.bar(1), e3.baz(x: 1);
  final x, y;
  const E(x, [y]);
  const E.foo({required x, y});
  const E.bar(x, [y]);
  const E.baz({required x, y}): x = x, y = y;
}

augment enum E {
  ;
  augment const E(dynamic this.x, [dynamic this.y]);
  augment const E.foo({required dynamic this.x, dynamic this.y});
  augment const E.bar(dynamic x, [dynamic y]) : x = x, y = y;
  augment const E.baz({required dynamic x, dynamic y}) : x = x, y = y;
}

extension type ET(int x) {
  ET.foo(int x, y);
  ET.bar(int x, [y]);
  ET.baz(int x, {y});
  ET.qux(int x, {required y});
}

augment extension type ET {
  augment ET.foo(this.x, dynamic y) {
    if (1 > 2) {
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
  augment ET.bar(this.x, [dynamic y]) {
    if (1 > 2) {
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
  augment ET.baz(this.x, {dynamic y}) {
    if (1 > 2) {
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
  augment ET.qux(this.x, {required dynamic y}) {
    if (1 > 2) {
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
}

main() {
  Expect.equals(1, C(1).x);
  Expect.equals(null, C(1).y);
  Expect.equals(1, C.foo(x: 1).x);
  Expect.equals(null, C.foo(x: 1).y);
  Expect.equals(1, C.bar(1).x);
  Expect.equals(null, C.bar(1).y);
  Expect.equals(1, C.baz(x: 1).x);
  Expect.equals(null, C.baz(x: 1).y);

  Expect.equals(1, E.e0.x);
  Expect.equals(null, E.e0.y);
  Expect.equals(1, E.e1.x);
  Expect.equals(null, E.e1.y);
  Expect.equals(1, E.e2.x);
  Expect.equals(null, E.e2.y);
  Expect.equals(1, E.e3.x);
  Expect.equals(null, E.e3.y);

  ET.foo(1, 1);
  Expect.equals("Augmented: 1, 1", _log);
  ET.bar(1);
  Expect.equals("Augmented: 1, null", _log);
  ET.baz(1);
  Expect.equals("Augmented: 1, null", _log);
  ET.qux(1, y: "42");
  Expect.equals("Augmented: 1, 42", _log);
}
