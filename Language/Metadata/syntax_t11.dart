// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///  metadata:
///   (‘@’ qualified (‘.’ identifier)? (arguments)?)*
///   ;
/// @description Check that it is a compile error if wrong type argument is used
/// @author sgrekhov@unipro.ru

import 'syntax_lib1.dart';

@Y<String>()
// ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class Test1 {}

@Z<String>(42)
// ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class Test2 {}

main() {
  Test1 test1 = new Test1();
  Test2 test2 = new Test2();
}
