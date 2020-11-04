/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the Issue 34741: Analyzer doesn't allow
 * function to use type parameter [<Instance of 'TypeParameterMember'>] as a
 * type argument whereas dart does allow this.
 * @Issue 34741
 * @author iarkh@unipro.ru
 */
Type typeOf<X>() => X;

typedef G = Function<X extends num>();
typedef G1<X> = Function();

main() {
  typeOf<G>();
//^
// [cfe] A generic function type can't be used as a type argument.
//       ^
// [analyzer] COMPILE_TIME_ERROR.GENERIC_FUNCTION_TYPE_CANNOT_BE_TYPE_ARGUMENT
  typeOf<G1>();
}
