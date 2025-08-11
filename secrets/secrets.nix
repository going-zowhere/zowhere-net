let
  # Machine keys
  root = "";
  user = "";

  # External key
  zoe = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyXLtQgXfkilT9AjSjqFa8CV2maM67rkisubJX8pYFY";

  # Group(s)
  zowhere = [
    root
    user
    zoe
  ];
in {
  # Secrets files
  user.age = zowhere;
  cpp-zoe.age = zowhere;
  cpp-gue.age = zowhere;
  cloud.age = zowhere;
  tunnel.age = zowhere;
  softsrv.age = zowhere;
  waste.age = zowhere;
}
