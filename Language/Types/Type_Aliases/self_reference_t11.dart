// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any self reference in a typedef, either directly, or recursively
/// via another typedef, is a compile time error.
/// @description Checks that it is compile error to reference type alias as a
/// type argument of its return type.
/// @author ilya
/// @issue 46062

typedef List<F> F();
//              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  F? x;
}
