// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable if all the following conditions
/// hold:
/// - It refers to a field (not a getter)
/// - The field is private
/// - The field is final
/// - There is no getter with the same name elsewhere in the library
/// - There is no non-final field with the same name elsewhere in the library
/// - There is no implicit noSuchMethod forwarder with the same name elsewhere
///   in the library.
///
/// @description Checks that if there is an implicit `noSuchMethod` forwarder
/// with the same name in another library then the field is promotable
/// @author sgrekhov22@gmail.com

library not_promotable_A06_lib;

class B {
  String get _x;

  dynamic noSuchMethod(Invocation inv) {}
}
