// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Constructs a regular expression.
/// @description Checks that null flags arguments can not be used with null
/// safety turned on.
/// @author rodionov

main() {
  RegExp re = new RegExp(r".", multiLine: null, caseSensitive: true);
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  re = new RegExp(r".", multiLine: false, caseSensitive: null);
//                                        ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
