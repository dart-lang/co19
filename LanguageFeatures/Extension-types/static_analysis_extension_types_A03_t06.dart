// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error if an extension type
/// declares a static method named `n` and a static setter with basename `n`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int id) {
  static int n() => 1;
//           ^
// [cfe] unspecified
  static void set n(int i) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
}
