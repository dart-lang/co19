// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is a compile-time error to declare an external
/// constructor on a JS interop extension type whose representation type is not
/// a subtype of [JSObject]. Test JS primitive types.
/// @author sgrekhov22@gmail.com
/// @issue 61314

import 'dart:js_interop';

extension type MyNumber._(JSNumber _) implements JSNumber {
  external MyNumber.fromDart(num value);
//^
// [analyzer] unspecified
// [web] unspecified
}

@JS('String')
extension type MyString._(JSString _) implements JSString {
  external MyString.fromDart(String value);
//^
// [analyzer] unspecified
// [web] unspecified
}

extension type Boolean._(JSBoolean _) implements JSBoolean {
  external Boolean.fromDart(bool value);
//^
// [analyzer] unspecified
// [web] unspecified
}

extension type MyBigInt._(JSBigInt _) implements JSBigInt {
  external MyBigInt.fromDart(int value);
//^
// [analyzer] unspecified
// [web] unspecified
}

@JS('Symbol')
extension type MySymbol(JSSymbol _) implements JSSymbol {
  external MySymbol.fromDart();
//^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(MyNumber);
  print(MyString);
  print(Boolean);
  print(MyBigInt);
  print(MySymbol);
}
