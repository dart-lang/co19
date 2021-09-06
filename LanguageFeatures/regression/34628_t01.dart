// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Regression test for the issue 34628 (Analyzer throws compile
/// error whereas dart passes when two depending classes ([B<X extends A<X>>] and
/// [A<X extends B<X>>]) are declared). Checks that it's impossible to declare
/// two classes [B<X extends A<X>>] and [A<X extends B<X>>].
/// @Issue 34628
/// @author iarkh@unipro.ru

class B<X extends A<X>> {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

class A<X extends B<X>> {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
