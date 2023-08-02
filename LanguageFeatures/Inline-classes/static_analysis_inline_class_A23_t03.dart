// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error if an extension type `V`
/// declares a static member with basename `n` and the interface of `V` has an
/// instance member with basename `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type I(int id) {
  void x() {}
}

extension type ET1(int id) implements I {
  static int get x => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) implements I {
  static int x() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
