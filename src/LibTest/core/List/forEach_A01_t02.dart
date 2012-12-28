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
 */

import "../../../Utils/dynamic_check.dart";

main() {
  [].forEach(null);
  [].forEach((var v){});

  if(isCheckedMode()) {
    return;
  }
  [].forEach(1); /// static type warning
  [].forEach(""); /// static type warning
  [].forEach(3.14); /// static type warning

  const [].forEach(1); /// static type warning
  const [].forEach(""); /// static type warning
  const [].forEach(3.14); /// static type warning

  new List().forEach(1); /// static type warning
  new List().forEach(""); /// static type warning
  new List().forEach(3.14); /// static type warning
}
