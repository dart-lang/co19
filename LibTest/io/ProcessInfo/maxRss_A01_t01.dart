/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int maxRss
 *
 * The high-watermark in bytes for the resident set size of memory for the
 * process.
 *
 * Note that the meaning of this field is platform dependent. For example, some
 * memory accounted for here may be shared with other processes, or if the same
 * page is mapped into a process's address space, it may be counted twice.
 *
 * @description Checks that [maxRss] returns int value.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(ProcessInfo.maxRss is int);
}
