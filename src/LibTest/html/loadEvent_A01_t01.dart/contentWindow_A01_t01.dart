/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion WindowBase get contentWindow
 * @description Checks that the property is of type WindowBase.
 */
import "dart:html";
import "../../../Utils/async_utils.dart";
import "../../../UtilsHtml/expect.dart";

const text="Hi there!";

main() {
  IFrameElement ife=new IFrameElement();
  document.body.append(ife);
//  IFrameElement ife2=document.getElementsByTagName('iframe')[0];
//  print("ife=ife; ife2=$ife2; eq=${ife==ife2}");
  WindowBase nw=ife.contentWindow;
  Expect.isTrue(nw is WindowBase);
  print("nw=$nw");
//  asyncStart();
  nw.addEventListener("message", (Event event) {
//  ife.addEventListener("message", (Event event) {
    print("ev=$event");
//    Expect.equals(text, event.data);
//    nw.close();
//    asyncEnd();
  });
  
  nw.postMessage(text,  "*");
  
}
/*
var o = document.getElementsByTagName('iframe')[0];
o.contentWindow.postMessage('Hello world', 'http://b.example.org/');
To register an event handler for incoming events, the script would use addEventListener() (or similar mechanisms). For example, the script in document B might look like:

window.addEventListener('message', receiver, false);
function receiver(e) {
  if (e.origin == 'http://example.com') {
    if (e.data == 'Hello world') {
      e.source.postMessage('Hello', e.origin);
    } else {
      alert(e.data);
    }
  }
}*/