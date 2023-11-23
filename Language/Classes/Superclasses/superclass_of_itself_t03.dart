// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class C is a superclass of itself
///
/// @description Checks that it is a compile-time error if a class references
/// itself in its extends clause. Test type aliases
/// @author sgrekhov@unipro.ru

class A extends AAlias {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

typedef AAlias = A;

main() {
  new A();
}
