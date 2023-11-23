// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The extension type parameter can also occur as a parameter type
/// for the method.
///
///   Example:
///
///   extension TypedEquals<T> {
///     bool equals(T value) => this == value;
///   }
///
/// Using such an extension as:
///
///   Object o = ...;
///   String s = ...;
///   print(s.equals(o));  // Compile-time type error.
///
/// will fail. While we could make it work by inferring [T] as [Object], we
/// don't. We infer [T] only based on the receiver type, and therefore [T] is
/// [String], and [o] is not a valid argument (at least not when we remove
/// implicit downcasts).
/// @description Check that compile time error is thrown when method type
/// parameter is incorrect.
/// @author iarkh@unipro.ru



extension TypedEquals<T> on T {
  bool equals(T value) => this == value;
}

main() {
  String s = "12345";
  bool b = s.equals(12);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}
