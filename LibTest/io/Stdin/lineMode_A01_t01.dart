/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool lineMode
 * Check if line mode is enabled on [stdin].
 * @description Checks that [lineMode] is a valid [boolean] value and can be
 * read inside the dart process.
 * @author iarkh@unipro.ru
 * @Issue 31932
 */
import "../../../Utils/expect.dart";
import "dart:io";

main(List<String> args) {
  Expect.isTrue(stdin.lineMode || !stdin.lineMode);
}
