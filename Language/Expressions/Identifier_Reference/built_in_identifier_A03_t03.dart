// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a syntax error if a built-in identifier is used as the
/// declared name of a prefix, class, mixin, enum, type parameter, type alias,
/// or extension.
///
/// @description Checks that it is a compile-time error if a built-in identifier
/// `covariant` is used as the declared name of a type alias.
/// @author sgrekhov22@gmail.com

typedef int covariant();
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef covariant = int;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
