// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to use a built-in identifier other than
/// dynamic as a type annotation or type parameter.
/// @description Checks that it is a compile-time error if a built-in identifier
/// "factory" is used as a type annotation of a local variable.
/// @author rodionov



main() {
 factory foo;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}
