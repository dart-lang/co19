// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the Issue 34636 (Analyzer does not throw
/// compile error for incorrect class (whereas dart does it)). Checks that
/// compile error appears when compile the following classes: [A<X extends B>],
/// [B<X extends C>], [C<X extends A<B>>].
/// @Issue 34636
/// @author iarkh@unipro.ru


class A<X extends B> {}
//                ^
// [analyzer] unspecified
class B<X extends C> {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
class C<X extends A<B>> {}
//                  ^
// [analyzer] unspecified

main() {}
