// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// setterSignature:
///   returnType? set identifier formalParameterList
/// ;
/// @description Checks if setter returns value other than void, then a compile
/// error occurs
/// @author sgrekhov@unipro.ru
/// @issue 42179


class C {
  String set s1(int value) => "42";
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C c = new C();
  c.s1 = 0;
}
