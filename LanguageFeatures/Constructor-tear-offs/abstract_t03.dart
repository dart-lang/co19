// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to tear off constructor of an abstract
/// class
///
/// @description Checks that It is a compile time error to tear off constructor
/// of an abstract class
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

class C<T> {
  C() {}
  C.named() {}
}

main() {
  var v1 = Type.new;
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v2 = (C<int>).new;
//          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
