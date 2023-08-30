// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constructorSignature:
///   identifier (‘.’ identifier)? formalParameterList
/// ;
/// @description Checks that it is a compile-time error if a named constructor
/// declares a return type
/// @author msyabro


class C {
  C C.name();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C.name();
}
