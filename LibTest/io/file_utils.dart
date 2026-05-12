// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// File and Directory utils
/// @author sgrekhov@unipro.ru

library file_utils;

import "dart:io";
import "dart:async";
import "dart:math";
import "../../Utils/expect.dart";

final int eventsTimeout = 45;

Future<Object?> inSandbox(
  Object? test(Directory sandbox), {
  Directory? sandbox,
}) async {
  if (sandbox == null) {
    sandbox = getTempDirectorySync();
  }
  try {
    asyncStart();
    return await test(sandbox);
  } finally {
    try {
      sandbox.deleteSync(recursive: true);
    } catch (_) {}
    asyncEnd();
  }
}

Future<void> testFileSystemEvent<T extends FileSystemEvent>(
  Directory root, {
  required Future<void> createEvent(),
  required void test(FileSystemEvent? event),
  bool failIfNoEvent = true,
  bool ignoreRootEvents = true,
}) async {
  final eventCompleter = new Completer<FileSystemEvent?>();
  bool first = true;
  StreamSubscription? subscription;
  subscription = root.watch().listen((FileSystemEvent event) async {
    if (!ignoreRootEvents || root.path != event.path) {
      if (event is T) {
        if (first) {
          first = false;
          eventCompleter.complete(event);
          await subscription?.cancel();
        }
      }
    }
  });
  await createEvent();
  final event = await eventCompleter.future.timeout(
    Duration(seconds: eventsTimeout),
    onTimeout: () async {
      await subscription?.cancel();
      if (failIfNoEvent) {
        Expect.fail("No event was fired for $eventsTimeout seconds");
      }
      return null;
    },
  );
  test(event);
}

/// Synchronously creates a temporary file.
///
/// If `parent` is specified, the file is created in that directory; otherwise,
/// `Directory.systemTemp` is used.
///
/// If `name` is specified, the file will have that name. Otherwise, a random
/// temporary name is generated.
File createTempFileSync({Directory? parent, String? name}) =>
    getTempFileSync(parent: parent, name: name);

/// TODO(sgrekhov): Replace by createTempFileSync
/**
 * Creates temporary file in a parent directory
 */
File getTempFileSync({Directory? parent, String? name}) {
  parent ??= Directory.systemTemp;
  name ??= getPrefix() + getTempFileName();
  File file = new File(parent.path + Platform.pathSeparator + name);
  file.createSync();
  return file;
}

Future<File> getTempFile({Directory? parent, String? name}) async {
  parent ??= Directory.systemTemp;
  name ??= getPrefix() + getTempFileName();
  return new File(parent.path + Platform.pathSeparator + name).create();
}

/// Synchronously creates a temporary directory.
///
/// If `parent` is specified, the directory is created in that directory;
/// otherwise, `Directory.systemTemp` is used.
///
/// If `name` is specified, the directory will have that name. Otherwise, a
/// random temporary name is generated.
Directory createTempDirectorySync({Directory? parent, String? name}) =>
    getTempDirectorySync(parent: parent, name: name);

/// TODO(sgrekhov): Replace by createTempDirectorySync
Directory getTempDirectorySync({Directory? parent, String? name}) {
  parent ??= Directory.systemTemp;
  if (name == null) {
    return parent.createTempSync(getPrefix());
  }
  Directory dir = new Directory(parent.path + Platform.pathSeparator + name);
  dir.createSync();
  return dir;
}

Future<Directory> getTempDirectory({Directory? parent, String? name}) async {
  parent ??= Directory.systemTemp;
  if (name == null) {
    return parent.createTemp(getPrefix());
  }
  Directory dir = new Directory(parent.path + Platform.pathSeparator + name);
  return dir.create();
}

/// Returns a new [Link] in the directory [parent], with the name [name] and the
/// target [target].
///
/// If [parent] is not specified, [Directory.systemTemp] is used.
/// If [target] is not specified, a temporary directory is created and used as
/// the link target.
/// If [name] is not specified, a temporary name is generated.
Link createTempLinkSync({Directory? parent, String? target, String? name}) =>
  getTempLinkSync(parent: parent, target: target, name: name);

/// TODO(sgrekhov): Replace by createTempLinkSync
Link getTempLinkSync({Directory? parent, String? target, String? name}) {
  parent ??= Directory.systemTemp;
  target ??= getTempDirectorySync(parent: parent).path;
  name ??= getPrefix() + getTempFileName(extension: ".lnk");
  Link link = new Link(parent.path + Platform.pathSeparator + name);
  link.createSync(target);
  return link;
}

Future<Link> getTempLink({Directory? parent, String? target, String? name}) {
  parent ??= Directory.systemTemp;
  target ??= getTempDirectorySync(parent: parent).path;
  name ??= getPrefix() + getTempFileName();
  Link link = new Link(parent.path + Platform.pathSeparator + name);
  return link.create(target);
}

void deleteLinkWithTarget(Link link) {
  String linkTarget = link.targetSync();
  FileSystemEntity? target = null;
  if (FileSystemEntity.isDirectorySync(linkTarget)) {
    target = new Directory(linkTarget);
  } else if (FileSystemEntity.isFileSync(linkTarget)) {
    target = new File(linkTarget);
  } else if (FileSystemEntity.isLinkSync(linkTarget)) {
    target = new Link(linkTarget);
  }
  try {
    target?.delete(recursive: true);
  } on Exception {}
  try {
    link.delete();
  } on Exception {}
}

Random rnd = new Random(new DateTime.now().microsecondsSinceEpoch);

String getTempFileName({String? extension}) {
  extension = (extension == null
      ? ".tmp"
      : (extension.startsWith(".") ? extension : ".$extension"));
  return "$pid-${rnd.nextInt(10000)}-${rnd.nextInt(10000)}-"
      "${rnd.nextInt(10000)}$extension";
}

String getTempDirectoryName() =>
    "$pid-${rnd.nextInt(10000)}-"
    "${rnd.nextInt(10000)}-${rnd.nextInt(10000)}-${rnd.nextInt(10000)}";

String getPrefix() {
  String fileName =
      Platform.script.pathSegments[Platform.script.pathSegments.length - 1];
  return "co19-" + fileName.substring(0, fileName.indexOf(".")) + "_";
}

/// Synchronously returns the path to a temporary file without actually creating
/// the file.
///
/// If [parent] is specified, the returned path will be in that directory.
/// Otherwise, [Directory.systemTemp] is used.
/// If [name] is specified, that file name is used. Otherwise, the result of
/// [getTempFileName] is used.
String getTempFilePath({Directory? parent, String? name}) {
  parent ??= Directory.systemTemp;
  name ??= getPrefix() + getTempFileName();
  return parent.path + Platform.pathSeparator + name;
}

String getTempDirectoryPath({Directory? parent, String? name}) {
  parent ??= Directory.systemTemp;
  name ??= getTempDirectoryName();
  return parent.path + Platform.pathSeparator + name;
}

String getEntityName(FileSystemEntity entity) =>
    entity.path.substring(entity.path.lastIndexOf(Platform.pathSeparator) + 1);
