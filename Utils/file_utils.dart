/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * File and Directory utils
 * @author sgrekhov@unipro.ru
 */
library file_utils;

import "dart:io";
import "dart:async";
import "dart:math";

/**
 * Creates temporary file in a temporary directory. Test must call
 * [file.parent.delete()] at the end
 */
File getTempFileSync([Directory parent]) {
  if (parent == null) {
    parent = Directory.systemTemp;
  }
  File file = new File(parent.path + Platform.pathSeparator + getPrefix() +
      getTempFileName());
  file.createSync();
  return file;
}

Directory getTempDirectorySync([Directory parent]) {
  if (parent == null) {
    parent = Directory.systemTemp;
  }
  Directory dir = parent.createTempSync(getPrefix());
  return dir;
}

Future<Directory> getTempDirectory([Directory parent]) async {
  if (parent == null) {
    parent = Directory.systemTemp;
  }
  return parent.createTempSync(getPrefix());
}

String getTempFileName([String ext]) {
  var rnd = new Random(new DateTime.now().microsecondsSinceEpoch);
  String name = rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString() + (ext == null ? ".tmp" : ext);
  return name;
}

String getTempDirectoryName() {
  var rnd = new Random(new DateTime.now().microsecondsSinceEpoch);
  String name = rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString();
  return name;
}

String getPrefix() {
  String fileName = Platform.script.pathSegments[Platform.script.pathSegments.length - 1];
  return fileName.substring(0, fileName.indexOf(".")) + "_";
}
