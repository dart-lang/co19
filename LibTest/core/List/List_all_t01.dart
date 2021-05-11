// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<E> abstract class 
/// @description Checks that List-specific methods work as specified.
/// @author kaigorodov

import "allListTests.lib.dart";

List<E> create<E>([int? length, E? fill]) {
  if (length == null) {
    return new List<E>.empty(growable: true);
  }
  if (fill != null) {
    return new List<E>.filled(length, fill);
  }
  throw new Exception(
    "If length was specified then fill must be specified as well");
}  

main() {
  test(create);  
}
