// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is a compile-time error if a JS interop type
/// member contains a type parameter that is a subtype of a Dart `bool`,
/// `String`, `num`, `int` or `double`.
/// @author sgrekhov22@gmail.com
/// @issue 61331

import 'dart:js_interop';

extension type MyNumber<T extends num>._(JSObject _) implements JSObject {
  external MyNumber(T t);
//                  ^
// [analyzer] unspecified
// [web] unspecified

  external T foo();
//         ^
// [analyzer] unspecified
// [web] unspecified
  external void bar(T _);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

@JS("String")
extension type MyString<T extends String>._(JSObject _) implements JSObject {
  external MyString(T t);
//                  ^
// [analyzer] unspecified
// [web] unspecified

  external T foo();
//         ^
// [analyzer] unspecified
// [web] unspecified
  external void bar(T _);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

extension type Boolean<T extends bool>._(JSObject _) implements JSObject {
  external Boolean(T t);
//                 ^
// [analyzer] unspecified
// [web] unspecified

  external T foo();
//         ^
// [analyzer] unspecified
// [web] unspecified
  external void bar(T _);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

extension type MyInt<T extends int>._(JSObject _) implements JSObject {
  external MyBigInt(T t);
//                  ^
// [analyzer] unspecified
// [web] unspecified

  external T foo();
//         ^
// [analyzer] unspecified
// [web] unspecified
  external void bar(T _);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

extension type MyDouble<T extends double>._(JSObject _) implements JSObject {
  external MyDouble(T t);
//                  ^
// [analyzer] unspecified
// [web] unspecified

  external T foo();
//         ^
// [analyzer] unspecified
// [web] unspecified
  external void bar(T _);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(MyNumber);
  print(MyString);
  print(Boolean);
  print(MyInt);
  print(MyDouble);
}
