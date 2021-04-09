module Make (Time : Mirage_time.S) : sig
  type configuration = {
    email : Emile.mailbox option;
    seed : string option;
    certificate_seed : string option;
    hostname : [ `host ] Domain_name.t;
  }

  val request_handler :
    Ipaddr.t * int -> Httpaf.Server_connection.request_handler

  val provision_certificate :
    ?production:bool ->
    configuration ->
    Mimic.ctx ->
    (Tls.Config.own_cert, [> `Msg of string ]) result Lwt.t

  val with_uri : Uri.t -> Mimic.ctx -> Mimic.ctx
end