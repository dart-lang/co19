// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///  metadata:
///   (‘@’ qualified (‘.’ identifier)? (arguments)?)*
///   ;
/// @description Check that type arguments are allowed on annotations
/// @author sgrekhov@unipro.ru

import 'syntax_lib1.dart';

@B<int>.b(10)
class Test1 {}

@B<String>()
class Test2 {}

@B<String>.b('aaa')
class Test3 {}

@Y<int>()
class Test4 {}

@Z<int>(42)
class Test5 {}

main() {
  Test1 test1 = new Test1();
  Test2 test2 = new Test2();
  Test3 test3 = new Test3();
  Test4 test4 = new Test4();
  Test5 test5 = new Test5();
}
