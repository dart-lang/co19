// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any self reference in a typedef, either directly, or recursively
/// via another typedef, is a compile time error.
/// @description Checks that it is compile error if more than two typedefs are
/// mutually recursive.
/// @author sgrekhov@unipro.ru
/// @issue 46062

typedef void F(G g);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
typedef H G();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
typedef void H(List<F> f);
//           ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(F);
  print(G);
  print(H);
}
