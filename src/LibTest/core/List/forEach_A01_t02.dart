/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Checks that no exception is thrown if the list is empty.
 * @author iefremov
 * @reviewer pagolubev
 * @static-warning
 */

import "../../../Utils/dynamic_check.dart";

main() {
  [].forEach(null);
  [].forEach((var v){});

  if(isCheckedMode()) {
    return;
  }
  [].forEach(1);
  [].forEach("");
  [].forEach(3.14);

  const [].forEach(1);
  const [].forEach("");
  const [].forEach(3.14);

  new List().forEach(1);
  new List().forEach("");
  new List().forEach(3.14);
}
