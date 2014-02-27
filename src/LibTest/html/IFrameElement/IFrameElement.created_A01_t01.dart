/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IFrameElement.created()
 * Constructor instantiated by the DOM when a custom element has been created.
 * This can only be called by subclasses from their created constructor.
 * @description Checks that this constructor can be called only by subclasses
 * @needreview Exception: Invalid class: expected instance of HtmlElement
 */
import "dart:html";
import "../../../Utils/async_utils.dart";
import "../../../UtilsHtml/expect.dart";

class MyIFrameElement extends IFrameElement {
  MyIFrameElement() : super.created();
}

main() {
  IFrameElement ife;
  Expect.throws((){
    ife=new IFrameElement.created();
  });
  ife=new MyIFrameElement();
  document.body.append(ife);
  WindowBase nw=ife.contentWindow;

  asyncStart();
  nw.addEventListener("message", (Event event) {
    Expect.equals(text, event.data);
    nw.close();
    asyncEnd();
  });
  
  nw.postMessage(text,  "*");
}
