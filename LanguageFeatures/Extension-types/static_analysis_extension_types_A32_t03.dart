// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V (which may include actual type arguments) can
/// be used in an object pattern (e.g., case V(): ... where V is an extension
/// type). Exhaustiveness analysis will treat such patterns as if they had been
/// an object pattern matching the extension type erasure of V.
///
/// @description Check that an extension type erasure is not used in an object
/// pattern outside of switch statements and expressions
/// @author sgrekhov22@gmail.com

class C {
  int x;
  C(this.x);
}

extension type ET1(C id) {}
extension type ET2(C id) {}
extension type ET3(C id) implements C {}

main() {
  var C(x: v1) = ET1(C(1));
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var ET1(x: v2) = ET1(C(2));
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  var ET1() = C(42);
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var ET1() = ET2(C(42));
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var ET3(x: v3) = C(42);
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var ET3(x: v4) = ET1(C(42));
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
