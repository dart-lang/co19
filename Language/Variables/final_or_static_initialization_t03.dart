// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A library or static variable is guaranteed to have an
/// initializer at its declaration by the grammar.
/// @description Checks that it is a compile error when a final static
/// variable is not initialized in its declaration. 
/// @author rodionov
/// @issue #27510


class C {
  static final bool v;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C.v);
}
