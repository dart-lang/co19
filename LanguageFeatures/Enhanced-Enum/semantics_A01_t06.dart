// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The Enum class behaves as if it was declared as:
///
/// class Enum {
///   // No default constructor.
///   external int get index;
///   external String toString();
/// }
/// We intend to (at least pretend to) let enum classes extend Enum, and let
/// mixins and members access the default index and toString() through super..
/// (In practice, we may use a different class implementing Enum as the
/// superclass, but for checking the validity of super.index/super.toString(),
/// we analyze against Enum itself, so it must have non-abstract
/// implementations.)
///
/// This all makes it look as if Enum would be a valid superclass for the mixin
/// applications and methods of the enhanced enum class.
///
/// @description Check that `index` cannot be overwritten
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
  e2,
  e3;

  final String index;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1<int>(42),
  e2<String>("Lily was here"),
  e3<bool>(false);

  const E2(T t);
  final String index;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1.e1;
}