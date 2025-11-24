// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when generally
/// supported). The types in these clauses are appended to the introductory
/// declarations’ clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types. All regular rules apply
/// after this appending process, so you cannot have multiple `extends` on a
/// class, or an `on` clause on an enum, etc.
///
/// @description Checks that a class, mixin, enum and extension type
/// augmentation may specify an `implements` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_types_A07_t01.dart';

augment class C implements I {
  String get id => "C";
}

augment mixin M implements I {
  String get id => "M";
}

augment enum E implements I {
  augment e1;
  String get id => "E";
}

augment extension type ET implements I {
  String get id => "ET";
}
