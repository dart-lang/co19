// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that if an extension type augment specifies an interface
/// in an `implements` clause which is not compatible with existing members then
/// existing members redeclare inherited ones.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class A {
  int foo() => 42;
}

extension type ET(A _) {
  String get foo => "ET";
}

augment extension type ET implements A {}

main() {
  Expect.equals("ET", ET(A()).foo);
}
