// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if a constructor augmentation
/// replaces type of formal parameter by `var`.
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
  augment C(var this.x, [var this.y]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.foo({required var this.x, var this.y}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.bar(var x, [var y]) : x = x, y = y{
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
  }
  augment C.baz({required var x, var y}) : x = x, y = y {
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
  augment e0(1);
  augment const E(var this.x, [var this.y]);
  augment const E.foo({required var this.x, var this.y});
  augment const E.bar(var x, [var y]);
  augment const E.baz({required var x, var y});
}

extension type ET(int x) {
  ET.foo(int this.x);
  ET.bar({required int this.x});
  ET.baz(int x, [int y = 0]);
  ET.qux({required int x, int y = 0});
}

augment extension type ET {
  augment ET.foo(var this.x, [var y]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.bar({required var this.x, var y}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.baz(var x, [var y]) : x = x {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.qux({required var x, var y}) : x = x {
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
