// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 34560 (Analyzer: Some correct
/// super-bounded types are rejected): check case with non-function type alias.
/// @Issue 34560, 45065
/// @author iarkh@unipro.ru

class C<X> {}
typedef A<X extends num> = C<X>;

A<dynamic>? a;
List<A<dynamic>>? lst;

main() {
  A<dynamic>();
//^
// [cfe] Type argument 'dynamic' doesn't conform to the bound 'num' of the type variable 'X' on 'A'.
//  ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS

}
