// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, or mixin augmentation may specify
/// extends, implements, on, and with clauses (when generally supported). The
/// types in these clauses are appended to the original declarations clauses of
/// the same kind, and if that clause did not exist previously then it is added
/// with the new types. All regular rules apply after this appending process, so
/// you cannot have multiple extends on a class, or an on clause on an enum, etc
///
/// @description Checks that a class, extension type, mixin and enum augment may
/// specify an additional `implements` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A06_t04.dart';

interface class I2 {
  String id2 => "I2";
}

augment class C implements I2 {
  String get id2 => "I2 from C";
}

augment extension type ET(I1 _) implements I0 {
  String get id0 => "I0 from ET";
}

augment mixin M implements I2 {
  String get id2 => "I2 from M";
}

augment enum E implements I2 {
  augment e1;
  String get id2 => "I2 from E";
}
