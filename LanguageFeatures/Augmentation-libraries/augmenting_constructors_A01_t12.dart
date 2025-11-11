// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if a constructor augmentation
/// specifies a type of formal parameter which were not explicitly specified in
/// the introductory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

String _log = "";

class C {
  int x, y;
  C(var x, [var y]);
  C.foo({required x, var y});
  C.bar(x, [y]);
  C.baz({required x, y});
}

augment class C {
  augment C(int this.x, [int this.y = 0]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.foo({required int this.x, int this.y = 0}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.bar(int x, [int y = 0]) : x = x, y = y {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.baz({required int x, int y = 0}) : x = x, y = y {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
}

enum E {
  e0(1), e1.foo(x: 1), e2.bar(1), e3.baz(x: 1);
  final int x, y;
  const E(var x, [var y]);
  const E.foo({required x, var y});
  const E.bar(x, [y = 0]): x = x, y = y;
  const E.baz({required x, y});
}

augment enum E {
  augment e0(1);
  augment const E(int this.x, [int this.y = 0]);
  augment const E.foo({required int this.x, int this.y = 0});
  augment const E.bar(int x, [int y = 0]) : x = x, y = y;
  augment const E.baz({required int x, int y = 0}) : x = x, y = y;
}

extension type ET(int x) {
  ET.foo(var x);
  ET.bar({required x});
  ET.baz(x, [y = 0]): x = x;
  ET.qux({required x, y = 0}): x = x;
}

augment extension type ET {
  augment ET.foo(int this.x, [int y]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.bar({required int this.x, int y}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.baz(int x, [int y]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.qux({required int x, int y}) {
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
  Expect.equals(1, ET.baz(1));
  Expect.equals("Augmented: 1, 0", _log);
}
