// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if there is more than one entity 
/// with the same name declared in the same scope.
/// Dart is lexically scoped. Scopes may nest. A name or declaration d is 
/// available in scope S if d is in the namespace induced by S or if d is 
/// available in the lexically enclosing scope of S. We say that a name or 
/// declaration d is in scope if d is available in the current scope.
///
/// @description Checks that it is a compile-time error if a class and a typedef 
/// declaration with the same name are declared within the library scope.
/// @author msyabro

class conflictingName {}

typedef conflictingName();
//      ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new conflictingName();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  conflictingName func = () {};
}
