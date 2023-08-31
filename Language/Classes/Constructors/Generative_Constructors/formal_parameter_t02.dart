// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A formal constructor parameter is either a formal parameter or
/// an initializing formal. An initializing formal has the form this.id, where
/// id is the name of an instance variable of the immediately enclosing class.
/// It is a compile-time error if id is not the name of an instance variable of
/// the immediately enclosing class.
/// @description Checks that it is a compile-time error if id is the name of a
/// static variable of the immediately enclosing class.
/// @author msyabro


class C {
  C(this.x) {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  static var x;
}

main() {
  new C(null);
}
