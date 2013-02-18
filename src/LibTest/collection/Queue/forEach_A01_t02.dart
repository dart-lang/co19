/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] to each element of the collection.
 * @description Checks forEach() on empty list.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Queue list = new Queue();
  
  int count = 0;
  list.forEach((var element) {
    count++;
  });
  
  Expect.isTrue(count == 0);
}
