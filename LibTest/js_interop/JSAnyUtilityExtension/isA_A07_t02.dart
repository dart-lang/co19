// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
/// ...
/// Using this method with a `T` that wraps a primitive JS type will result in
/// an error telling you to use the primitive JS type instead.
///
/// @description Checks that it is a compile-time error if an extension type on
/// JS primitive types is used as a type argument of `isA`. Test extension types
/// with rename.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JS("Number")
extension type MyNumber(JSNumber _) implements JSNumber {}

@JS("String")
extension type MyString(JSString _) implements JSString {}

@JS("Boolean")
extension type MyBoolean(JSBoolean _) implements JSBoolean {}

@JS("BigInt")
extension type MyBigInt(JSBigInt _) implements JSBigInt {}

@JS("Symbol")
extension type MySymbol(JSSymbol _) implements JSSymbol {}

test(JSAny v) {
  v.isA<MyNumber>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified

  v.isA<MyString>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified

  v.isA<MyBoolean>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified

  v.isA<MyBigInt>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified

  v.isA<MySymbol>();
//  ^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(test);
}
