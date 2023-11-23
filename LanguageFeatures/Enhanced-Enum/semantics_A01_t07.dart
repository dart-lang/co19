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
/// @issue 48353

enum E1 {
  e1(11),
  e2(22),
  e3(33);

  final int _index;
  int get index => _index;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const E1(this._index);
}

enum E2 {
  e1(11),
  e2(22),
  e3(33);

  final int _index;
  @override
  int get index => _index;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const E2(this._index);
}

main() {
  E1.e1;
  E2.e1;
}
