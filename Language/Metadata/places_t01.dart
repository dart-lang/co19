/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  Metadata can appear before a library, part header, class, typedef, type
 *  parameter, constructor, factory, function, parameter, or variable
 *  declaration, and before an import, export, or part directive.
 *
 * @description Check that metadata can appear before a library, class, typedef,
 * type parameter, constructor, factory, function, parameter, or variable
 * declaration
 * @author sgekhov@unipro.ru
 */

import "places_lib.dart";

class A {
    const A();
}

void foo() {}

// class
@A()
class C1 {}

// typedef
@A()
typedef void Foo();

// type parameter
class C2<@A() T> {}
void bar<@A() T>() {}

// constructor
class C3 {
  @A() C3() {}
}

// factory
class C4 {
  factory C4() => new C4();
}

// function
@A() int test1() => 42;

// parameter
int test2(@A() int x) => x;

// variable declaration
@A() int x = 42;

main() {
  new C1();
  Foo f = foo;
  bar<int>();
  new C3();
  test1();
  test2(42);
}
