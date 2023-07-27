// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the declared return type of a
/// function marked sync* is not a supertype of Iterable<T> for some type T
///
/// @description Check that it is a compile error, if the declared return type
/// of synchronous generator function is not a supertype of `Iterable<T>`
/// @author a.semenov@unipro.ru

/**/int f() sync* { }
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  f();
}
