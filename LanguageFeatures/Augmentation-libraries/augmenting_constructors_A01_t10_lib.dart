// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the constructor augmentation does not match the original
///   constructor. It must have the same number of positional parameters, the
///   same named parameters, and matching parameters must have the same type,
///   optionality, and any required modifiers must match. Any initializing
///   formals and super parameters must also be the same in both constructors.
///
/// @description Checks that it is not an error if a constructor augmentation
/// omits types of formal parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A01_t10.dart';
import '../../Utils/static_type_helper.dart';

augment class C {
  augment C(this.x, [final this.y = 0]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment C.foo({required this.x, final this.y = 0}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment C.bar(x, [final y = 0]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment C.baz({required x, final y = 0}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
}

augment enum E {
  augment e0(1);
  augment const E(this.x, [final this.y = 0]);
  augment const E.foo({required this.x, final this.y = 0});
  augment const E.bar(x, [final y = 0]);
  augment const E.baz({required x, final y = 0});
}

augment extension type ET {
  augment ET.foo(this.x, [final y = 0]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.bar({required this.x, final y = 0}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.baz(x, [final y = 0]) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
  augment ET.qux({required x, final y = 0}) {
    x.expectStaticType<Exactly<int>>();
    y.expectStaticType<Exactly<int>>();
    _log = "Augmented: $x, $y";
  }
}
