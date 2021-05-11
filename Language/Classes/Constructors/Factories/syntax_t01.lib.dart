// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library lib;
import "syntax_t01.dart" as test;

// References a factory class in another library
abstract class A {
  factory A () { return new test.AImpl(); }
  factory A.named() {return new test.AImpl();}
  int methodA();
}
