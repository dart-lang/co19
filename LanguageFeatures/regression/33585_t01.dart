// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Regression test for the issue 33585, 33308 (CFE doesn't check
/// type arguments against the bounds of the corresponding type variables)
/// @Issue 33585
/// @author iarkh@unipro.ru


abstract class B<X extends int> extends Object{}
class A implements B<List>{}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
