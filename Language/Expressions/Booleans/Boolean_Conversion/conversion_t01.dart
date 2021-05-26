// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  Because boolean conversion requires its parameter to be a
/// boolean, any construct that makes use of boolean conversion will cause a
/// dynamic type error in checked mode if the value to be converted is not a
/// boolean.
/// @description Checks that it is a compile error to convert int to bool.
/// @author msyabro
/// @reviewer rodionov


int i = 1;

main() {
  i ? '' : '  ';
//^
// [analyzer] unspecified
// [cfe] unspecified
}
