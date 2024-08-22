// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The extension type's representation object is not a variable,
/// even though it looks and behaves much like one, and it cannot be augmented
/// as such. It is a compile time error to have any augmenting declaration with
/// the same name as the representation object.
///
/// @description Checks that it is a compile-time error to declare any
/// augmenting declaration with the same name as the representation variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'extension_types_A03_t01_lib.dart';

extension type ET1(int id) {}

extension type ET2(int id) {}

extension type ET3(int id) {}

extension type ET4(int id) {}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
