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
 */
import "dart:html";
import "../../../Utils/async_utils.dart";
import "../../../UtilsHtml/expect.dart";

class MyIFrameElement extends IFrameElement {
  MyIFrameElement.created() : super.created();
}

main() {
  var ife;
  Expect.throws((){
    ife=new IFrameElement.created();
  });

  var tag = 'my-iframe';
  document.register(tag, MyIFrameElement, extendsTag:"iframe");

  ife = new Element.tag(tag);
  document.body.append(ife);
  Expect.isTrue(ife is MyIFrameElement);
}
