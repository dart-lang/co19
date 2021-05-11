// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 33805 (Analyzer throws error when
/// try to assign a function result to row variable). Checks that error appears
/// if row variable is passed to the function parameter
/// @Issue 33805
/// @issue 43362
/// @author iarkh@unipro.ru

class A<X> {}
testme<X extends A<X>>(X) {}

A a = new A();
A<A> a1 = new A<A>();
A<A<A>> a2 = new A<A<A>>();

main() {
  testme(a);
//^^^^^^
// [analyzer] COMPILE_TIME_ERROR.COULD_NOT_INFER
// [cfe] Inferred type argument 'A<Object?>' doesn't conform to the bound 'A<X>' of the type variable 'X' on 'testme'.
  testme(a1);
//^^^^^^
// [analyzer] COMPILE_TIME_ERROR.COULD_NOT_INFER
// [cfe] Inferred type argument 'A<Object?>' doesn't conform to the bound 'A<X>' of the type variable 'X' on 'testme'.
  testme(a2);
//^^^^^^
// [analyzer] COMPILE_TIME_ERROR.COULD_NOT_INFER
// [cfe] Inferred type argument 'A<Object?>' doesn't conform to the bound 'A<X>' of the type variable 'X' on 'testme'.
}
