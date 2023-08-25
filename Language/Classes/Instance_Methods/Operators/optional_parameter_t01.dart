// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to declare an optional parameter in an 
/// operator.
///
/// @description Checks that a compile-time error is produced if a user-defined
/// operator [] specifies an optional positional parameter.
/// @author iefremov

class C {
  operator []([var o]) {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C()[1];
}
