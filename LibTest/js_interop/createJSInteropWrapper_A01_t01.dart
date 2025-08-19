// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSObject createJSInteropWrapper<T extends Object>( T dartObject )
///
/// Given a instance of a Dart class that contains an `@JSExport` annotation,
/// creates a JavaScript object that wraps the given Dart object.
///
/// The object literal will be a map of properties, which are either the written
/// instance member names or their renames, to callbacks that call the
/// corresponding Dart instance members.
///
/// See https://dart.dev/interop/js-interop/mock for more details on how to
/// declare classes that can be used in this method.
///
/// @description Check that it is a compile-time error argument of
/// [createJSInteropWrapper] function does not contain `@JSExport` annotation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

class C {
  int foo() => 42;
}

main() {
  createJSInteropWrapper<C>(C());
//^
// [analyzer] unspecified
// [web] unspecified
}
