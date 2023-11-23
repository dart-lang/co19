// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The tear-off cannot be performed without the [.new] because that
/// expression already means something else.
///
/// @description Check that the tear-off cannot be performed without the [.new]:
/// tests default constructor call
/// @author iarkh@unipro.ru

class C<X> {
  C(int a, String b, c) {}
}

main() {
  var v = C;
  C c = v(1, "", null);
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  var v1 = C.C;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

}
