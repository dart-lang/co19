/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a class [C] in a legacy library implements the same generic
 * class [I] more than once, it is an error if the [LEGACY_ERASURE] of all such
 * super-interfaces are not all syntactically equal. For the purposes of runtime
 * subtyping checks, [C] is considered to implement the canonical
 * [LEGACY_ERASURE] of the super-interfaces in question.
 *
 * Using the legacy erasure for checking super-interfaces accounts for opted-out
 * classes which depend on both opted-in and opted-out versions of the same
 * generic interface.
 *
 *  //opted in
 *  class I<T> {}
 *
 *  // opted in
 *  class A implements I<int?> {}
 *
 *  // opted out
 *  class B implements I<int> {}
 *
 *  // opted out
 *  class C extends A implements B {}
 *
 *  The class [C] is not considered erroneous, despite implementing both
 *  [I<int?>] and [I<int*>], since legacy erasure makes both of those interfaces
 *  equal. The canonical interface which [C] is chosen to implement for the
 *  purposes of runtime type checks is [I<int*>].
 *
 * @description Check that error occurs if a class implements the same generic
 * class more than once the [LEGACY_ERASURE] of all such super-interfaces are
 * not all syntactically equal and all passes otherwise. Test [Object] legacy
 * type parameter.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
// @dart=2.6

import "override_checking_A05_opted_in_lib.dart";

class B implements A<Object> {}

class B_nullable_Object extends in_Nullable_Object implements B {}
class B_Object          extends in_Object          implements B {}

class B_nullable_int extends in_nullable_int implements B {}
//    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_nullable_Function extends in_nullable_Function implements B {}
//    ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_int extends in_int implements B {}
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_Function extends in_Function implements B {}
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_dynamic extends in_dynamic implements B {}
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_void extends in_void implements B {}
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_Null extends in_Null implements B {}
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_Never extends in_Never implements B {}
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_FutureOr extends in_FutureOr implements B {}
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_FutureOr_int extends in_FutureOr_int implements B {}
//    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B_FutureOr_FutureOr extends in_FutureOr_FutureOr implements B {}
//    ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
