// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 33805 (Analyzer throws error when
/// try to assign a function result to row variable).
/// @Issue 33805
/// @author iarkh@unipro.ru

class A<X> {}
X testme<X extends A<X>>(dynamic x) => x;

main() {
  A a = testme(new A());
//      ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.COULD_NOT_INFER
// [cfe] Inferred type argument 'A<dynamic>' doesn't conform to the bound 'A<X>' of the type variable 'X' on 'testme'.
  A<A> a1 = testme(new A<A>());
//          ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.COULD_NOT_INFER
// [cfe] Inferred type argument 'A<A<dynamic>>' doesn't conform to the bound 'A<X>' of the type variable 'X' on 'testme'.
  A<A<A>> a2 = testme(new A<A<A>>());
//             ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.COULD_NOT_INFER
// [cfe] Inferred type argument 'A<A<A<dynamic>>>' doesn't conform to the bound 'A<X>' of the type variable 'X' on 'testme'.
}
