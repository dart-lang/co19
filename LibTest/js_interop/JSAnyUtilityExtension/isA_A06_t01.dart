// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
/// ...
/// Using this method with a `T` that has an object literal constructor will
/// result in an error as you likely want to use [JSObject] instead.
///
/// @description Checks that it is a compile-time error if a type with an object
/// literal constructor is used as a type argument of `isA`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET1._(JSObject _) implements JSObject {
  external ET1({int id, String name});
}

extension type ET2(JSObject _) implements JSAny {
  external ET2.n({int id, String name});
}

@JS("Array")
extension type ET3(JSArray _) implements JSObject {
  external ET3.n({int id, String name});
}

test(JSAny v) {
  v.isA<ET1>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified

  v.isA<ET2>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified

  v.isA<ET3>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(test);
}
