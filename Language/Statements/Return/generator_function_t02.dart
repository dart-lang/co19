// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a return statement of the form
/// `return e;` appears in a generator function.
///
/// @description Check that it is a compile-time error if a return statement of
/// the form `return e;` appears in a synchronous generator method.
/// @author a.semenov@unipro.ru

class C {
  Iterable test() sync* {
    return 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

mixin M {
  Iterable test() sync* {
    return 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E {
  e0;
  Iterable test() sync* {
    return 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class A {}

extension Ext on A {
  Iterable test() sync* {
    return 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int v) {
  Iterable test() sync* {
    return 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
