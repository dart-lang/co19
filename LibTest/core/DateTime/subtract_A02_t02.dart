// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DateTime subtract(Duration other)
/// Throws [Error] if [other] is [:null:].
/// @description Checks that a compile error appears if [object] is [:null:]
/// statically.
/// @author iarkh


main() {
  DateTime dateTime = new DateTime(2000, 1, 1);
  dateTime.subtract(null);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

}
