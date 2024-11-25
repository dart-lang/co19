// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a function declaration does not declare a return type
/// explicitly, its return type is dynamic, unless it is a constructor, in which
/// case it is not considered to have a return type, or it is a setter or
/// operator []=, in which case its return type is void
///
/// @description Checks that if a setter or operator `[]=` declaration does not
/// declare a return type then the return type is `void` and it's a compile-time
/// error to return a value from this declaration.
/// @author sgrekhov22@gmail.com

set globalSetter(int _) {
  return 0;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C {
  operator []=(int index, Object? value) {
    return 0;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static set staticSetter(int _) {
    return 0;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  set instanceSetter(int _) {
    return 0;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  globalSetter = 1;
  print(C);
}
