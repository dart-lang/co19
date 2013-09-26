/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void action(E entry))
 * Call action with each entry in the list.
 * @description Checks that no exception is thrown if the list is empty.
 * @static-warning
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/dynamic_check.dart";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  new LinkedList().forEach(null);
  new LinkedList().forEach((var v){});

  if(isCheckedMode()) {
    return;
  }
  new LinkedList().forEach(1); /// static type warning
  new LinkedList().forEach(""); /// static type warning
  new LinkedList().forEach(3.14); /// static type warning
}
