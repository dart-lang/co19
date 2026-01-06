// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that an augmentation of an extension type may specify a
/// base, final or sealed class in an `implements` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'augmentation_libraries_lib.dart';

extension type ET1(FinalClass _) {}

augment extension type ET1 implements FinalClass {}

extension type ET2(BaseClass _) {}

augment extension type ET2 implements BaseClass {}

extension type ET3(SealedClass _) {}

augment extension type ET3 implements SealedClass {}

main() {
  FinalClass fc = ET1(FinalClass());
  BaseClass bc = ET2(BaseClass());
  SealedClass sc = ET3(SealedClassImpl());
}
