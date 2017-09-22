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
 * Creates temporary file in a parent directory
 */
File getTempFileSync({Directory parent, String name}) {
  parent ??= Directory.systemTemp;
  name ??= getPrefix() + getTempFileName();
  File file = new File(parent.path + Platform.pathSeparator + name);
  file.createSync();
  return file;
}

Future<File> getTempFile({Directory parent, String name}) async {
  parent ??= Directory.systemTemp;
  name ??= getPrefix() + getTempFileName();
  return new File(parent.path + Platform.pathSeparator + name).create();
}

Directory getTempDirectorySync({Directory parent, String name}) {
  parent ??= Directory.systemTemp;
  if (name == null) {
    return parent.createTempSync(getPrefix());
  }
  Directory dir = new Directory(parent.path + Platform.pathSeparator + name);
  dir.createSync();
  return dir;
}

Future<Directory> getTempDirectory({Directory parent, String name}) async {
  parent ??= Directory.systemTemp;
  if (name == null) {
    return parent.createTemp(getPrefix());
  }
  Directory dir = new Directory(parent.path + Platform.pathSeparator + name);
  return dir.create();
}

Link getTempLinkSync({Directory parent, String target, String name}) {
  parent ??= Directory.systemTemp;
  target ??= getTempDirectorySync(parent: parent).path;
  name ??= getPrefix() + getTempFileName(extension: ".lnk");
  Link link = new Link(parent.path + Platform.pathSeparator + name);
  link.createSync(target);
  return link;
}

Future<Link> getTempLink({Directory parent, String target, String name}) {
  parent ??= Directory.systemTemp;
  target ??= getTempDirectorySync(parent: parent).path;
  name ??= getPrefix() + getTempFileName();
  Link link = new Link(parent.path + Platform.pathSeparator + name);
  return link.create(target);
}

void deleteLinkWithTarget(Link link) {
  String linkTarget = link.targetSync();
  if (linkTarget == null) {
    return;
  }
  FileSystemEntity target = null;
  if (FileSystemEntity.isDirectorySync(linkTarget)) {
    target = new Directory(linkTarget);
  } else if (FileSystemEntity.isFileSync(linkTarget)) {
    target = new File(linkTarget);
  } else if (FileSystemEntity.isLinkSync(linkTarget)) {
    target = new Link(linkTarget);
  }
  try {
    target.delete(recursive: true);
  } on Exception {}
  try {
    link.delete();
  } on Exception {}
}

String getTempFileName({String extension}) {
  var rnd = new Random(new DateTime.now().microsecondsSinceEpoch);
  extension = (extension == null
      ? ".tmp"
      : (extension.startsWith(".") ? extension : "." + extension));
  String name = rnd.nextInt(10000).toString() +
      "-" +
      rnd.nextInt(10000).toString() +
      "-" +
      rnd.nextInt(10000).toString() +
      "-" +
      rnd.nextInt(10000).toString() +
      extension;
  return name;
}

String getTempDirectoryName() {
  var rnd = new Random(new DateTime.now().microsecondsSinceEpoch);
  String name = rnd.nextInt(10000).toString() +
      "-" +
      rnd.nextInt(10000).toString() +
      "-" +
      rnd.nextInt(10000).toString() +
      "-" +
      rnd.nextInt(10000).toString();
  return name;
}

String getPrefix() {
  String fileName =
      Platform.script.pathSegments[Platform.script.pathSegments.length - 1];
  return fileName.substring(0, fileName.indexOf(".")) + "_";
}

String getTempFilePath({Directory parent, String name}) {
  parent ??= Directory.systemTemp;
  name ??= getPrefix() + getTempFileName();
  return parent.path + Platform.pathSeparator + name;
}

String getTempDirectoryPath({Directory parent, String name}) {
  parent ??= Directory.systemTemp;
  name ??= getTempDirectoryName();
  return parent.path + Platform.pathSeparator + name;
}

String getEntityName(FileSystemEntity entity) =>
    entity.path.substring(entity.path.lastIndexOf(Platform.pathSeparator) + 1);
