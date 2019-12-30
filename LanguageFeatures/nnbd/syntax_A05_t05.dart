/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The modifier required is added as a built-in identifier. The
 * grammar of function types is extended to allow any named parameter
 * declaration to be prefixed by the required modifier (e.g. int Function(int,
 * {int? y, required int z}).
 *
 * @description Check that it is a compile error if 'required' modifier is
 * misplaced
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

typedef String Foo1(required int x, {String z, required String y});
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef String Foo2(int x, [String z, required String y]);
//                                    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef String Foo3(int x, {String z, final required A y});
//                                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
