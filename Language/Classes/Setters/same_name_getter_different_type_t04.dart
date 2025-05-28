// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error if a class has a setter named `v=` with
/// argument type `T` and a getter named `v` with return type `S`, and `S` may
/// not be assigned to `T`.
///
/// @description Checks that it is no compile error if class defines a setter
/// named 'foo=' and a getter named 'foo' with argument/return types that are
/// mutually assignable. Types in getter/setter signatures provided explicitly
/// @author sgrekhov@unipro.ru

class A {}
class B extends A {}

class C {
  set foo(A a) { }
  
  B get foo => new B();
}

main() {
  new C().foo = new C().foo;
}
