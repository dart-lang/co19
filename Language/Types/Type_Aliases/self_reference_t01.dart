// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Any self reference in a typedef, either directly, or recursively
/// via another typedef, is a compile time error.
/// @description Checks that self-referencing typedef is not allowed (return
/// value type annotation has the same name as the type alias).
/// @author msyabro


typedef F F();
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    null is F;
  } catch (x) {}
}
