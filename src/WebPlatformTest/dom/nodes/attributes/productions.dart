library productions;

const invalid_names = const ["\\", "'", '"', "0", "0:a"]; // XXX
const valid_names = const ["x", ":", "a:0"];
const invalid_qnames = const [":a", "b:", "x:y:z"]; // XXX
