// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Regression test for the Issue 34741: Analyzer doesn't allow
/// function to use type parameter [<Instance of 'TypeParameterMember'>] as a
/// type argument whereas dart does allow this.
/// @note: after https://github.com/dart-lang/language/issues/496 generic
/// function types as type arguments and bounds are allowed, so there is a error
/// in dart 2.9, but there should not be error in the recent dart versions.
/// @Issue 30931, 34741
/// @author iarkh@unipro.ru

Type typeOf<X>() => X;

typedef G = Function<X extends num>();
typedef G1<X> = Function();

main() {
  typeOf<G>();  //# 01: compile-time error
  typeOf<G1>();
}
