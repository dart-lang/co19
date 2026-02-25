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
/// @description Checks that it is not an error if a constructor augmentation
/// omits types of formal parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

String _log = "";

class C {
  var x, y;
  C(int x, [int y = 0]);
  C.foo({required int x, int y = 0});
  C.bar(int x, [int y = 0]);
  C.baz({required int x, int y = 0});
}

augment class C {
  augment C(this.x, [this.y]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.foo({required this.x, this.y}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.bar(x, [y]) : x = x, y = y {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.baz({required x, y}) : x = x, y = y {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
}

enum E {
  e0(1), e1.foo(x: 1), e2.bar(1), e3.baz(x: 1);
  final x, y;
  const E(int this.x, [int this.y = 0]);
  const E.foo({required int this.x, int this.y = 0});
  const E.bar(int x, [int y = 0]): x = x, y = y;
  const E.baz({required int x, int y = 0}): x = x, y = y;
}

augment enum E {
  ;
  augment const E(x, [y]);
  augment const E.foo({required x, y});
  augment const E.bar(x, [y]);
  augment const E.baz({required x, y});
}


extension type ET(int x) {
  ET.foo(int x, [int y = 0]);
  ET.bar({required int x, int y = 0});
  ET.baz(int x, [int y = 0]);
  ET.qux({required int x, int y = 0});
}

augment extension type ET {
  augment ET.foo(this.x, [y]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.bar({required this.x, y}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.baz(x, [y]) : x = x {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.qux({required x, y}) : x = x {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
}

main() {
  Expect.equals(1, C(1).x);
  Expect.equals(0, C(1).y);
  Expect.equals(1, C.foo(x: 1).x);
  Expect.equals(0, C.foo(x: 1).y);
  Expect.equals(1, C.bar(1).x);
  Expect.equals(0, C.bar(1).y);
  Expect.equals(1, C.baz(x: 1).x);
  Expect.equals(0, C.baz(x: 1).y);

  Expect.equals(1, E.e0.x);
  Expect.equals(0, E.e0.y);
  Expect.equals(1, E.e1.x);
  Expect.equals(0, E.e1.y);
  Expect.equals(1, E.e2.x);
  Expect.equals(0, E.e2.y);
  Expect.equals(1, E.e3.x);
  Expect.equals(0, E.e3.y);

  Expect.equals(1, ET.foo(1).x);
  Expect.equals("Augmented: 1, 0", _log);
  Expect.equals(1, ET.bar(x: 1).x);
  Expect.equals("Augmented: 1, 0", _log);
  Expect.equals(1, ET.baz(1).x);
  Expect.equals("Augmented: 1, 0", _log);
}
