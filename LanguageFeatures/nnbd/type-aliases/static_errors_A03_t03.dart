/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call an expression whose type is potentially
 * nullable and not dynamic.
 *
 * @description Check that it is a compile-time error to call an expression
 * whose type is potentially nullable and not dynamic. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,extension-methods,nonfunction-type-aliases
// Requirements=nnbd-strong
extension on int {
  int call(int v) => this + v;
}
void foo() {}
typedef void Foo();

typedef IntAlias = int?;
typedef FunctionAlias = Function?;
typedef FooAlias = Foo?;

main() {
  IntAlias i = 42;
  i(1);
//^^
// [analyzer] unspecified
// [cfe] unspecified

  FunctionAlias f1 = foo;
  f1();
//^^
// [analyzer] unspecified
// [cfe] unspecified

  FooAlias f2 = foo;
  f2();
//^^
// [analyzer] unspecified
// [cfe] unspecified

}
