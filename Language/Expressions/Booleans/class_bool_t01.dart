// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Both  true and false are implement the built-in class bool.
/// @description Checks that true and false are implement the built-in interface
/// bool.
/// @author msyabro


import '../../../Utils/expect.dart';

main() {
  checkType(checkIs<bool>, true, false);
  checkType(checkIs<bool>, true, true);
}
