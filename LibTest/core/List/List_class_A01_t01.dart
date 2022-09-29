// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion List<E> abstract class 
/// @description Checks that List-specific methods work as specified.
/// @author kaigorodov

import "allListTests.lib.dart";

List create([int length = null]) {
  if (length == null) {
    return [];
  } else {
    return new List.filled(length, null);
  }
}  

main() {
  test(create);  
}
