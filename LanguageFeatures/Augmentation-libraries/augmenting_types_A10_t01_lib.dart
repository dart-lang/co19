// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that instance members defined in the body of an augment
/// of a class, mixin or enum are added to an instance namespace of the
/// corresponding type in the augmented library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A10_t01.dart';

augment class C {
  String method() => "C";
  String get getter => "get C";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}

augment mixin M {
  String method() => "M";
  String get getter => "get M";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}

augment enum E {
  augment e1;
  String method() => "E";
  String get getter => "get E";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}
