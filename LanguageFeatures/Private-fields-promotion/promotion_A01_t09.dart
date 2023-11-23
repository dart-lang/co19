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
/// @description Checks that an instance field is promotable if all of the
/// conditions above are met. Test an extension type
/// @author sgrekhov22@gmail.com
/// @issue 53439

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int? _id) {
  void test() {
    if (_id != null) {
      _id.isOdd;
    }
  }
}

extension type ET2<T>(T _id) {
  void test() {
    if (_id is int) {
      _id.isOdd;
    }
  }
}

main() {
  ET1 et1 = ET1(1);
  if (et1._id != null) {
    et1._id.isEven;
  }

  ET2<num?> et2 = ET2(2);
  if (et2._id is int) {
    et2._id.isEven;
  }
}
