// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the implements clause of a class
/// C specifies a type T as a superinterface more than once.
///
/// @description Checks that it is a compile-time error if the same type appears
/// more than once in the implements clause. Test type aliases
/// @Issue 45526
/// @author sgrekhov@unipro.ru

abstract class I {}
abstract class J {}

typedef IAlias = I;

class A implements I, J, IAlias {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new A();
}
