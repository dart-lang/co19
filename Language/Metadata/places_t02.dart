// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
///  Metadata can appear before a library, part header, class, typedef, type
///  parameter, constructor, factory, function, parameter, or variable
///  declaration, and before an import, export, or part directive.
///
/// @description Test generic metadata: Check that annotation cannot use type
/// arguments in version 2.9.
/// @author iarkh@unipro.ru

class A<T> {
    const A(T t);
}

void foo() {}

// class
@A<int>(42)
//^
// [analyzer] unspecified
// [cfe] unspecified

class C1 {}

// typedef
@A<int>(42)
//^
// [analyzer] unspecified
// [cfe] unspecified

typedef void Foo();

// type parameter
class C2<@A<int>(42) T> {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified

void bar<@A<int>(42) T>() {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified

// constructor
class C3 {
  @A<int>(42) C3() {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}

// factory
class C4 {
  @A<int>(42) factory C4() => new C4();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}

// function
@A<int>(42) int test1() => 42;
//^
// [analyzer] unspecified
// [cfe] unspecified

// parameter
int test2(@A<int>(42) int x) => x;
//          ^
// [analyzer] unspecified
// [cfe] unspecified

// variable declaration
@A<int>(42) int x = 42;
//^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C1();
  Foo f = foo;
  bar<int>();
  C3();
  test1();
  test2(42);
}
