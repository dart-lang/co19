// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Compile-time errors associated with constructors occur
/// accordingly.
///
/// @description Checks that it is a compile-time error if an extension type
/// constructor doesn't initialize the instance variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int id) {
  ET1.new() {
//^^^
// [analyzer] unspecified
// [cfe] unspecified
    id = 0;
  }

  const ET1.n1(int id) {
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
    this.id = id;
  }
}
main() {
  print(ET1);
}
