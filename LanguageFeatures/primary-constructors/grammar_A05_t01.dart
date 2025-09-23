// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class contains two or more
/// declarations of a declaring constructor.
///
/// @description Check that it is a compile-time error if a class contains more
/// than one declaration of a declaring constructor.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C1 {
  this(var int v, final String s);
  this(var int v, {final String s = ""});
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  this(var int v, final String s);
  const this(var int v, {final String s = ""});
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
