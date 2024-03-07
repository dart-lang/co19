// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Compile-time errors associated with constructors occur
/// accordingly.
///
/// @description Checks that it is a compile-time error if an extension type
/// constructor doesn't initialize the instance variable
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {
  ET1.n1(int id);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2<T>(T id) {
  ET2.n1(int id) {}
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
