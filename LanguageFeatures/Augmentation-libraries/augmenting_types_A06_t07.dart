// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension, extension type, or mixin augmentation
/// may specify extends, implements, on, and with clauses (when generally
/// supported). The types in these clauses are appended to the original
/// declarations clauses of the same kind, and if that clause did not exist
/// previously then it is added with the new types. All regular rules apply
/// after this appending process, so you cannot have multiple extends on a
/// class, or an on clause on an enum, etc
///
/// @description Checks that a mixin augment may specify an `on` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A06_t07_lib.dart';

class A {}

class C implements A {}

mixin M on A {}

class MA = C with M;

main() {
  A a = MA();
  C c = MA();
}
