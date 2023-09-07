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

extension type ET(int? _id) {
  void test() {
    if (_id != null) {
      _id.isOdd;
    }
  }
}

main() {
  ET et = ET(1);
  et.test();
  if (et._id != null) {
    et._id.isEven;
  }
}
