// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V is always-exhaustive if and only if its
/// instantiated representation type is always-exhaustive.
///
/// @description Check that an extension type is not always-exhaustive if its
/// representation type is not always-exhaustive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type IntET(int i) {}

String test1(IntET v) {
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (v) {
    case IntET(i: 1):
      return "1";
    case IntET(i: 2):
      return "2";
  }
}

String test2(IntET v) =>
    switch (v) {
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      IntET(i: 1) => "1",
      IntET(i: 2) => "2"
    };

main() {
  print(test1);
  print(test2);
}
