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
  "user.age".publicKeys = zowhere;
  "cpp-zoe.age".publicKeys = zowhere;
  "cpp-gue.age".publicKeys = zowhere;
  "cloud.age".publicKeys = zowhere;
  "tunnel.age".publicKeys = zowhere;
  "softsrv.age".publicKeys = zowhere;
  "waste.age".publicKeys = zowhere;
}
