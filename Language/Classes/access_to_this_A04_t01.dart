// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The current instance (and hence its members) can only be accessed at
/// specific locations in a class: We say that a location ℓ has access to this
/// iff ℓ is inside the body of a declaration of an instance member or a
/// generative constructor, or in the initializing expression of a late instance
/// variable declaration.
///
/// Note that an initializing expression for a non-late instance variable does
/// not have access to this, and neither does any part of a declaration marked
/// static.
///
/// @description Checks that it is a compile-time error if `this` is accessed in
/// an initializing expression of a static variable
/// @author sgrekhov22@gmail.com

class C1 {
  int x = 0;
  static int y = this.x;
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static late int z = this.x;
//                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  final x = 0;
  static final int y = this.x;
//                     ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static late final int z = this.x;
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  int x = 0;
  static var y = this.x;
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static late var z = this.x;
//                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
}
