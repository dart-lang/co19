// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a syntax error if a built-in identifier is used as the
/// declared name of a prefix, class, mixin, enum, type parameter, type alias,
/// or extension.
///
/// @description Checks that it is a compile-time error if a built-in identifier
/// `extension` is used as the name, type parameter or alias of an extension
/// type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type extension(int _) {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ListET<extension>(List<extension> _) {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET(int _) {}

typedef extension = ET;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
