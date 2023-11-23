// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Static type annotations are used in variable declarations
/// (including formal parameters), in the return types of functions and in the
/// bounds of type variables. Static type annotations are used during static
/// checking
/// type:
///   typeName typeArguments?
/// ;
/// typeName:
///   qualified
/// ;
/// typeArguments:
///   '<' typeList '>'
/// ;
/// typeList:
///   type (',' type)*
/// ;
/// @description Checks that it is a compile-time error when the list of type
/// arguments in a static type annotation is empty.
/// @author iefremov


class Generic<T> {
  Generic() {}
}

main() {
  Generic <>? t;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}
