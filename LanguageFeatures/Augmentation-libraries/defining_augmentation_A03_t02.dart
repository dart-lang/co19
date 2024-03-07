// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A top-level declaration in an augmentation has the same name as a
///   declaration in the main library or another of its augmentations (unless it
///   is an augmenting declaration)
///
/// @description Checks that it is a compile-time error if a top-level
/// declaration in an augmentation has the same name as a declaration in another
/// augmentation of the same library.
/// @author sgrekhov22@gmail.com
/// @issue 55113

// SharedOptions=--enable-experiment=macros

import augment 'defining_augmentation_A03_t03_lib1.dart';
import augment 'defining_augmentation_A03_t03_lib2.dart';

main() {
  print(C);
  print(M);
  print(E);
  print(foo);
  print(Foo);
  print(StringAlias);
  print(getter);
  setter = 1;
  print(List);
  print(ET);
  print(x);
  print(c);
}
