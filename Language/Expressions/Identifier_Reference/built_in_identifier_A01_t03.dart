// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a syntax error if a built-in identifier is used as the
/// declared name of a prefix, class, mixin, enum, type parameter, type alias,
/// or extension.
///
/// @description Checks that it is a compile-time error if a built-in identifier
/// `abstract` is used as the declared name of a type alias.
/// @author rodionov

typedef int abstract();
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef abstract = int;
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
