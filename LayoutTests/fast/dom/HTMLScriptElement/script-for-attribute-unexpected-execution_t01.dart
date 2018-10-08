/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that scripts which have a for-event other than
 * window.onload are not executed.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var s0 = new ScriptElement();
  s0.async = false;
  s0.src = "$root/../../../resources/js-test.js";
  document.head.append(s0);

  asyncStart();
  s0.onLoad.first.then((_) {
    document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

    var s = new ScriptElement();
    s.attributes['for'] = 'window';
    s.text = "debug('for=window')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['for'] = 'anything';
    s.text = "debug('for=anything')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['event'] = 'onload';
    s.text = "debug('event=onload')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['event'] = 'anything';
    s.text = "debug('event=anything')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['for'] = 'window';
    s.attributes['event'] = 'onload';
    s.text = "debug('for=window event=onload')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['for'] = 'window';
    s.attributes['event'] = 'onload()';
    s.text = "debug('for=window event=onload()')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['for'] = 'WINDOW';
    s.attributes['event'] = 'ONLOAD()';
    s.text = "debug('for=WINDOW event=ONLOAD()')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['for'] = 'window';
    s.attributes['event'] = 'onresize';
    s.text = "debug('for=window event=onresize')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['for'] = 'document';
    s.attributes['event'] = 'onload';
    s.text = "debug('for=document event=onload')";
    document.body.append(s);

    s = new ScriptElement();
    s.attributes['for'] = 'document';
    s.attributes['event'] = 'onclick';
    s.text = "debug('for=document event=onclick')";
    document.body.append(s);

    var expected = [
      'for=window',
      'for=anything',
      'event=onload',
      'event=anything',
      'for=window event=onload',
      'for=window event=onload()',
      'for=WINDOW event=ONLOAD()',
    ];

    asyncStart();
    window.onLoad.first.then((_) {
      Expect.listEquals(expected, consoleList());
      asyncEnd();
    });
    asyncEnd();
  });
}
