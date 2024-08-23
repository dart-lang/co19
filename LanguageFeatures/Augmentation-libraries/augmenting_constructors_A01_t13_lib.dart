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
/// @description Checks that it is not an error if an introductory constructor
/// parameters implicitly have type `dynamic` and the augmenting constructor
/// specifies it explicitly.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A01_t13.dart';

augment class C {
  augment C(dynamic this.x, [dynamic this.y]) {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
  augment C.foo({required dynamic this.x, dynamic this.y}) {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
  augment C.bar(dynamic x, [dynamic y]) {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
  augment C.baz({required dynamic x, dynamic y}) {
    if (1 > 2) {
      x.checkDynamic;
      y.checkDynamic;
    }
    _log = "Augmented: $x, $y";
  }
}

augment enum E {
  augment e0(1);
  augment const E(dynamic this.x, [dynamic this.y]);
  augment const E.foo({required dynamic this.x, dynamic this.y});
  augment const E.bar(dynamic x, [dynamic y]);
  augment const E.baz({required dynamic x, dynamic y});
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
