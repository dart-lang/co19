// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJS
/// ...
/// If the static type of the [Function] could not be determined or if the
/// static type uses types that are disallowed, the call will fail to compile.
/// See https://dart.dev/interop/js-interop/js-types#requirements-on-external-declarations-and-function-tojs
/// for more details on what types are allowed.
///
/// @description Check that it is a compile-time error if this function has any
/// named parameters.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

int foo({int v = 0}) => v;

int bar({required int v}) => v;

main() {
  foo.toJS;
//    ^^^^
// [analyzer] unspecified
// [web] unspecified
  bar.toJS;
//    ^^^^
// [analyzer] unspecified
// [web] unspecified
}
