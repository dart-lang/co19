/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RandomAccessFile> lock([
 *     FileLock mode = FileLock.EXCLUSIVE,
 *     int start = 0,
 *     int end = -1
 * ])
 *
 * @description Used in lock_A04_* tests.
 * @author ngl@unipro.ru
 */
import "dart:io";

main(List<String> args) {
  File file = new File(args[0]);
  int start = null;
  int end = null;
  var mode = FileLock.EXCLUSIVE;
  switch (args[1]) {
    case 'SHARED' : mode = FileLock.SHARED; break;
    case 'BLOCKING_SHARED' : mode = FileLock.BLOCKING_SHARED; break;
    case 'BLOCKING_EXCLUSIVE' : mode = FileLock.BLOCKING_EXCLUSIVE;
  }
  if (args[2] != 'null') {
    start = int.parse(args[2]);
  }
  if (args[3] != 'null') {
    end = int.parse(args[3]);
  }
  var raf = file.openSync(mode: APPEND);

  try {
    raf.lockSync(mode, start, end);
    print('LOCK SUCCEEDED');
  } catch (e) {
    print('LOCK FAILED');
  } finally {
    raf.closeSync();
  }
}
