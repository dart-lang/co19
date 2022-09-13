// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A built-in class [Record] with no members except those inherited
/// from [Object]. All record types are a subtype of this class. This type
/// cannot be constructed, extended, mixed in, or implemented by user-defined
/// classes.
///
/// @description Checks that it is a compile error to mix-in [Record] class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

mixin M1 on Record {
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 on (int, {String s}) {
//          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3 on () {
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
