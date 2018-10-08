/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>This page tests event listener fire order for a few objects that had it wrong in the past.</p>

      <div id="div"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var result;

  reset()
  {
    result = [ ];
  }

  f1(_)
  {
    result.add("f1");
  }

  f3(_)
  {
    result.add("f3");
  }

  f4(_)
  {
    result.add("f4");
  }

  f2(event)
  {
    result.add("f2");
    event.target.removeEventListener(event.type, f3, false); // Removed: should not fire.
    event.target.addEventListener(event.type, f4, false); // Added after dispatch began: should not fire.
  }

  reportResult(name, expected)
  {
    debug(name);
    shouldBeList(result, expected);
  }

  var tests = [
    /*testDiv*/()
    {
      reset();
      var x = document.getElementById("div");
      x.addEventListener("click", f1, false);
      x.onClick.listen(f2);
      x.addEventListener("click", f3, false);

      var event = new MouseEvent("click", canBubble: true, cancelable: true,
          view: window, detail: 1,
          screenX: 0, screenY: 0,
          clientX: 0, clientY: 0,
          ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
          button: 0, relatedTarget: document);
      x.dispatchEvent(event);

      reportResult("testDiv", [ "f1", "f2" ]);
    },

    /*testXHR*/()
    {
      reset();
      var x = new HttpRequest();
      x.addEventListener("readystatechange", f1, false);
      x.onReadyStateChange.listen(f2);
      x.addEventListener("readystatechange", f3, false);

      x.open("GET", "IntentionallyMissingFile");

      reportResult("testXHR", [ "f1", "f2" ]);
    },

    /*testXHRUpload*/()
    {
      reset();
      var x = new HttpRequest();
      x.upload.addEventListener("abort", f1, false);
      x.upload.onAbort.listen(f2);
      x.upload.addEventListener("abort", f3, false);

      x.open("POST", "IntentionallyMissingFile");
      x.send();
      x.abort();

      reportResult("testXHRUpload", [ "f1", "f2" ]);
    }
  ];

  for (var i = 0; i < tests.length; ++i)
    tests[i]();
}
