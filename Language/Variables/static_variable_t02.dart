// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a library variable declaration has
/// the modifier `static`.
///
/// @description Checks that it is a compile-time error to preface a top-level
/// variable declaration with the built-in identifier `static`.
/// @author kaigorodov

/**/static var v1 = 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

/**/static int v2 = 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

/**/static final v3 = 1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

/**/late static final v4 = 1;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
