// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that it is a compile-time error if an augmentation of an
/// extension type's implicit constructor has a signature which doesn't exactly
/// match the introductory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'extension_types_A02_t03_lib.dart';

extension type ET1(int id) {}
extension type ET2(int id) {}
extension type ET3(int id) {}
extension type ET4(int id) {}
extension type ET5(int id) {}
extension type ET6(int id) {}
extension type ET7(int id) {}
extension type ET8(num id) {}
extension type ET9(int id) {}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
  print(ET7);
  print(ET8);
}
