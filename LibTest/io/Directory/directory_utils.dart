/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
library directory_utils;

import "dart:io";
import "dart:async";
import "dart:math";

Future<Directory> getTempDirectory(String parent) async {
  if (parent == null) {
    parent = "";
  }
  var rnd = new Random(new DateTime.now().microsecondsSinceEpoch);
  String name = getTempDirectoryName();
  if (parent != "" && !parent.endsWith(Platform.pathSeparator)) {
    parent += Platform.pathSeparator;
  }
  Directory dir = new Directory(parent + name);
  if(await dir.exists()) {
    return getTempDirectory(parent);
  };
  return dir;
}

String getTempDirectoryName() {
  var rnd = new Random(new DateTime.now().microsecondsSinceEpoch);
  String name = rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString() + "-" +
      rnd.nextInt(10000).toString();
  return name;
}
