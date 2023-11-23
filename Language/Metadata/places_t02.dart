// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///  Metadata can appear before a library, part header, class, typedef, type
///  parameter, constructor, factory, function, parameter, or variable
///  declaration, and before an import, export, or part directive.
///
/// @description Check that metadata can appear before a library, class, typedef,
/// type parameter, constructor, factory, function, parameter, or variable
/// declaration. Test generic metadata
/// @author sgekhov@unipro.ru


class A<T> {
    const A(T t);
}

void foo() {}

// class
@A<int>(42)
class C1 {}

// typedef
@A<int>(42)
typedef void Foo();

// type parameter
class C2<@A<int>(42) T> {}
void bar<@A<int>(42) T>() {}

// constructor
class C3 {
  @A<int>(42) C3() {}
}

// factory
class C4 {
  @A<int>(42) factory C4() => new C4();
}

// function
@A<int>(42) int test1() => 42;

// parameter
int test2(@A<int>(42) int x) => x;

// variable declaration
@A<int>(42) int x = 42;

main() {
  new C1();
  Foo f = foo;
  bar<int>();
  new C3();
  test1();
  test2(42);
}
