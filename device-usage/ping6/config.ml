open Mirage

let main =
  foreign
    ~packages:[ package ~min:"3.0.0" "ethernet" ; package ~min:"7.0.0" "tcpip"]
    "Unikernel.Main" (console @-> network @-> ethernet @-> ipv6 @-> job)
let net = default_network
let ethif = etif net
let ipv6 = create_ipv6 net ethif

let () =
  register "ping" [ main $ default_console $ default_network $ ethif $ ipv6 ]
