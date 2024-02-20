// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a syntax error if a built-in identifier is used as the
/// declared name of a prefix, class, mixin, enum, type parameter, type alias,
/// or extension.
///
/// @description Checks that it is a compile-time error if a built-in identifier
/// `deferred` is used as the declared name of a class, mixin or enum.
/// @author ngl@unipro.ru
/// @issue 25732

class deferred {}
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin deferred {}
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum deferred {e1;}
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
