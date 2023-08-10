// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile-time error if the declared return type of a
/// function marked sync* or async* is void.
///
/// @description Check that it is a compile error, if the declared return type
/// of a function marked `async*` is `void`.
/// @issue 32192
/// @author a.semenov@unipro.ru

/**/void h() async* { }
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  h();
}
