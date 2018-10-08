/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  boom(_) {
    var divNode = document.createElement('div');
    document.documentElement.append(divNode);
    var divShadow1 = divNode.createShadowRoot();
    var divShadow2 = divNode.createShadowRoot();

    var videoNode = document.createElement('video');
    divShadow2.append(videoNode);

    var shadowNode = document.createElement('shadow');
    videoNode.append(shadowNode);

    var text = new Text('Hello');
    divShadow1.append(text);

    testPassed("unless crash");
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(boom);
}
