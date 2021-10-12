// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
///  metadata:
///   (‘@’ qualified (‘.’ identifier)? (arguments)?)*
///   ;
/// @description Check that type arguments are not allowed on annotations in
/// version 2.9.
/// @author sgrekhov@unipro.ru

import 'syntax_lib1.dart';

@B<int>.b(10)
//^
// [analyzer] unspecified
// [cfe] unspecified

class Test1 {}

@B<String>()
//^
// [analyzer] unspecified
// [cfe] unspecified

class Test2 {}

@B<String>.b('aaa')
//^
// [analyzer] unspecified
// [cfe] unspecified

class Test3 {}

@Y<int>()
//^
// [analyzer] unspecified
// [cfe] unspecified

class Test4 {}

@Z<int>(42)
//^
// [analyzer] unspecified
// [cfe] unspecified

class Test5 {}

main() {
  Test1 test1 = new Test1();
  Test2 test2 = new Test2();
  Test3 test3 = new Test3();
  Test4 test4 = new Test4();
  Test5 test5 = new Test5();
}
