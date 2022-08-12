// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable only if
/// (a) it is private,
/// (b) it is final, and
/// (c) all other concrete instance getters with the same name in the same
/// library are also final fields
///
/// @description Checks that if there are other concrete instance getters with
/// the same name in the same library and they are not a final fields then the
/// field is not promotable. Test when the variable with the same name is not
/// final in some class in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

part of "promotion_A05_t10.dart";

class C {
  int? _x = 43;

  C() {
    print(_x);
  }
}
