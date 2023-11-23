// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constructorSignature:
///   identifier (‘.’ identifier)? formalParameterList
/// ;
/// @description Checks that constructor name cannot contain 3 identifiers.
/// @author kaigorodov


class C {
//    ^
// [cfe] unspecified
  C.c1.c2();
//^
// [analyzer] unspecified
// [cfe] unspecified
  C.c3() {}
}

main() {
  new C.c3();
}
