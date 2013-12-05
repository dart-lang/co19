/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void action(E entry))
 * Call action with each entry in the list.
 * @description Checks that no exception is thrown if the list is empty.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/dynamic_check.dart";

main() {
  new LinkedList().forEach(null);
  new LinkedList().forEach((var v){});

  if(isCheckedMode()) {
    return;
  }
  var action=1;
  new LinkedList().forEach(action);
  action="";
  new LinkedList().forEach(action);
  action=3.14;
  new LinkedList().forEach(action);
}
