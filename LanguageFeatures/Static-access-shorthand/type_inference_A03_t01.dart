// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Non-constant shorthand:
/// ...
/// It's a compile-time error if the shorthand context does not denote a
/// declaration and static namespace.
///
/// @description Checks that it's a compile-time error if the shorthand context
/// does not denote a declaration and static namespace.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

dynamic getDynamic() {
  if (DateTime.now().millisecond.isEven) {
    return .new();
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void getVoid() {
  if (DateTime.now().millisecond.isEven) {
    return .new();
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Never getNever() {
  if (DateTime.now().millisecond.isEven) {
    return .new();
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

(int,) getRecord1() {
  if (DateTime.now().millisecond.isEven) {
    return .new();
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Record getRecord2() {
  if (DateTime.now().millisecond.isEven) {
    return .new();
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
  return .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Function getFunction1() {
  if (DateTime.now().millisecond.isEven) {
    return .new();
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

typedef Func = void Function();

Func getFunction2() {
  if (DateTime.now().millisecond.isEven) {
    return .new();
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
  return .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(getDynamic);
  print(getVoid);
  print(getNever);
  print(getRecord1);
  print(getRecord2);
  print(getFunction1);
  print(getFunction2);
}
