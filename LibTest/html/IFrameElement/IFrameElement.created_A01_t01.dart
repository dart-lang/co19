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
import "../../../UtilsHtml/expect.dart";

class MyIFrameElement extends IFrameElement {
  factory MyIFrameElement() {
    return new Element.tag('my-iframe');
  }

  MyIFrameElement.created() : super.created();

  String testit() => "In testit";
}

main() {
  var ife;
  Expect.throws(() {
    ife = new IFrameElement.created();
  });

  var tag = 'my-iframe';
  document.register(tag, MyIFrameElement, extendsTag: "iframe");

  ife = document.createElement('iframe', 'my-iframe');
  document.body.append(ife);
  Expect.isTrue(ife is MyIFrameElement);
  Expect.equals("In testit", ife.testit());
}
