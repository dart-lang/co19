// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if any default values are specified in
/// the signature of a function type in a type alias
/// @description Checks that it is a compile-time error if any default values are
/// specified in the signature of a function type in a type alias
/// @author sgrekhov@unipro.ru


typedef void F1(String s = "");               //# 01: compile-time error
typedef String F2(String s, int i = -1);      //# 02: compile-time error
typedef int F3(String s, [int i = -1]);       //# 03: compile-time error
typedef F4(String s, {int i = -1});           //# 04: compile-time error

main() {
}
