// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 33585, 33308 (CFE doesn't check
/// type arguments against the bounds of the corresponding type variables)
/// @Issue 33585
/// @author iarkh@unipro.ru


class A {}
class B{}

class M<X extends A> {}
class O extends Object with M<B> {}
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
