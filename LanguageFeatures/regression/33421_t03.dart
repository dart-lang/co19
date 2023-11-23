// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for issue 33421 (Dart does not throw error when
/// type parameter is a supertype of its upper bound): checks that compile error
/// appears for the case
///   class A<X extends B> {}
///   class B<X extends A> {}
/// @Issue 33421
/// @author iarkh@unipro.ru


class A<X extends B> {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
class B<X extends A> {}
//                ^
// [analyzer] unspecified

main() {}
