// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
///
/// Since the type-check this function emits is determined at compile-time, `T`
/// needs to be an interop extension type that can also be determined at
/// compile-time. In particular, `isA` can't be provided a generic type variable
/// as a type argument.
///
/// @description Checks that it is a compile-time error id `T` is a type
/// variable.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

test<T extends JSAny?>(JSAny? v) {
  v.isA<T>();
//      ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  test<JSObject>(JSObject());
}
