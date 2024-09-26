// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the first segment in segments is "dart":
/// - It is a compile-time error if there are no subsequent segments.
///
/// @description Checks that it is a compile-time error if "dart" is the only
/// segment in the path. Test `export` directive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

export dart show String;
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified

export dart hide List;
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
