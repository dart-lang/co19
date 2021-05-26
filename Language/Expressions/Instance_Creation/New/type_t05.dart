// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Let e be a new expression of the form
/// new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) or the form
/// new T(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
/// @description Checks that it is a compile error if T is a reference to
/// a top-level variable.
/// @author msyabro
/// @reviewer iefremov


var a;

main() {
  new a();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
