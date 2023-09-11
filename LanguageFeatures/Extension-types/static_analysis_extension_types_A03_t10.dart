// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error error if an extension
/// type declares an instance setter with the same basename as the instance
/// getter but with an incompatible type
/// @author sgrekhov22@gmail.com
/// @issue 53489

// SharedOptions=--enable-experiment=inline-class

extension type I(int id) {
  void set x(String i) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int id) {
  void set x(String i) {}
  int get x => 42;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) implements I {
  int get x => 42;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
