// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a generic class named G declares a type variable named X, it
/// is a compile-time error if X is equal to G, or if G has a member whose
/// basename is X, or if G has a constructor named G.X.
///
/// @description Checks that a type variable can not have the same name as
/// the name of generic class instance variable.
/// @author ilya

class A<T> {
//      ^
// [analyzer] unspecified
  var T;
//    ^
// [cfe] unspecified
}

main() {
  new A(); 
}
