// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class with a primary constructor that also has a body
/// part with an initializer list. A compile-time error occurs if an instance
/// variable declaration has an initializing expression, and it is also
/// initialized by an element in the initializer list of the body part, or by an
/// initializing formal parameter of the primary constructor.
///
/// @description Check that it is a compile-time error if an instance variable
/// declaration has an initializing expression, and it is also initialized by an
/// element in the initializer list of the body part.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C(this.x) {
  int x;
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
