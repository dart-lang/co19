
import 'dart:html';
import 'common.dart';

log(message) {
  var console = doc.getElementById("console");
  var li = doc.createElement("li");
  var pre = doc.createElement("pre");
  pre.append(new Text(message));
  li.append(pre);
  console.append(li);
}

var expected = '''This test checks to see if innerHTML is outputting in the proper case, i.e. all tags and methods lower-case.

Original: <BR /><br /><HR /><hr /><Br><dIv sTyLe="color:bluE;"></dIv>Result:   <br><br><hr><hr><br><div style="color:bluE;"></div>
''';

main() {
  init("""
<div id="description">This test checks to see if innerHTML is outputting in the proper case, i.e. all tags and methods lower-case.</div>
<div id="test" style="display:none"></div>
<div id="console"></div>
""");

  var html = "<BR /><br /><HR /><hr /><Br><dIv sTyLe=\"color:bluE;\"></dIv>";

  var e = doc.getElementById("test");
  e.setInnerHtml(html, treeSanitizer: new NoCheck());

  log("Original: " + html);
  log("Result:   " + e.innerHtml);

  checkText(expected);
}
