library utilities;
import "dart:html";
import "../../../testharness.dart";

// Start the bidding at 42 for no particular reason.
int lastID = 42;

String canonicalize(String url) {
  int id = ++lastID;
  document.body.appendHtml("<a id='$id' href='$url'></a>", treeSanitizer: new NullTreeSanitizer());
  Element elem = document.getElementById(id.toString());
  String res = (elem as AnchorElement).href;
//  print("'$url'=>'$res'");
  return res;
}

void setBaseURL(url) {
    // Remove any existing base elements.
    List<Node> existingBase = document.getElementsByTagName('base');
    for (Node element in existingBase) {
        element.remove();
    }

    // Add a new base element.
    document.body.appendHtml('<base href="$url">', treeSanitizer: new NullTreeSanitizer());
}

List<String> segments(String url) {
  int id = ++lastID;
  String idstr = id.toString();
  document.body.appendHtml("<a id='$idstr' href='$url'></a>", treeSanitizer: new NullTreeSanitizer());
  AnchorElement elmt = document.getElementById(idstr) as AnchorElement;
  return [
    elmt.protocol,
    elmt.hostname,
    elmt.port,
    elmt.pathname,
    elmt.search,
    elmt.hash
  ];
}
