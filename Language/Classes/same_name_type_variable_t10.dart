// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a generic class named G declares a type variable named X, it
/// is a compile-time error if X is equal to G, or if G has a member whose
/// basename is X, or if G has a constructor named G.X.
///
/// @description Checks that it is a compile-time error if a class `C` has a
/// constructor named `C.T`, where `T` is a type variable
/// @author sgrekhov22@gmail.com

class C<T> {
//      ^
// [analyzer] unspecified
  C.T() {}
//^
// [cfe] unspecified
}

main() {
  print(C);
}
