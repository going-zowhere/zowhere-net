let
  # Machine keys
  root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEWEgZHMLYpViu8lvaQvr8PTcOtNfVQLNZx3P8HMuNMW root@zowhere";
  zoe = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyXLtQgXfkilT9AjSjqFa8CV2maM67rkisubJX8pYFY 223009927+going-zowhere@users.noreply.github.com";

  # Group(s)
  zowhere = [
    root
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
