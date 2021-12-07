// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final Stream<ProgressEvent> onLoad
/// Stream of load events handled by this HttpRequestEventTarget.
/// @description Checks the state of request at various moments of time.
/// @author sgrekhov@unipro.ru
/// @Issue https://github.com/dart-lang/co19/issues/932

import "dart:html";
import "../../../Utils/expect.dart";

int get crossOriginPort {
  var searchUrl = window.location.search!;
  var crossOriginStr = 'crossOriginPort=';
  var index = searchUrl.indexOf(crossOriginStr);
  var nextArg = searchUrl.indexOf('&', index);
  return int.parse(searchUrl.substring(index + crossOriginStr.length,
      nextArg == -1 ? searchUrl.length : nextArg));
}

var port = crossOriginPort;
var host = '${window.location.protocol}//${window.location.hostname}:$port';

main() {
  FormData data = FormData();
  List<String> file_contents = ["Lily was here"];
  Blob blob = new Blob(file_contents, 'text/plain', 'native');
  data.appendBlob("uploadData", blob);

  var url = '$host/upload';
  final r = new HttpRequest();
  r.open("POST", url);
  HttpRequestUpload upload = r.upload;
  asyncStart();
  upload.onLoad.listen((ProgressEvent event) {
    Expect.isNotNull(event.loaded);
    Expect.isTrue(event.loaded! > 0);
    asyncEnd();
  });
  r.send(data);
}
