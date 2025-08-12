# zowhere-net

nix(os) configuration for a lil server and website, coming soon ;3

right now the most basic functionality is present, copyparty works(?), and i have a decent idea of the roadmap from here. a lot of things still need some polish and/or additional configuarion, but i'm pretty happy with the progress!

## todo list for full launch

### core/system stuff

- [x] hardware-configuration.nix
- [x] initial secrets files
- [x] disko/dirlayout configs
- [x] more proper SSH config
- [x] define generated ssh keys
- [ ] fix passwd/secrets situation
- [ ] networking/firewall stuffs
  - [ ] static ip
  - [ ] port (un)blocking
- [x] addl cloudflare config
- [ ] user config for soft-serve?
- [x] db for wastebin(maybe)
- [ ] static-web-server setup
- [ ] figure out sws content generation

### conveniences

- [ ] some shell aliases
- [ ] shell.nix for remote dev
- [ ] proper WARP ssh access

### fluff/cosmetic

- [ ] readmes/logues for cpp
- [ ] fun lil motd for ssh login
- [ ] add git config stuff
- [ ] starship/zoxide/eza/etc.
- [ ] fancy 404/err pages for sws
- [ ] maintenance mode setup for sws

## planned initial services

- copyparty: private file server, with a public upload dir
- soft-serve: private-ish git server, available on web or ssh
- wastebin: public pastebin with basic features, may change

## additional future stuff

- jellyfin (maybe, copyparty is probably good enough)
- some kind of chat/comment/forum/social thing
- a proper status/uptime dashboard for all services
- linktree-type thing for services and my stuff
- web ssh/telnet client (for r0c if i go that route)

## installation (theoretically)

run this command:

```bash
sudo nix --experimental-features "nix-command flakes" run 'github:nix-community/disko/latest#disko-install' -- --write-efi-boot-entries --flake 'github:going-zowhere/zowhere-net#zowhere-mini' --disk main /dev/sda
```

## installation (realistically)

1. clone this repo to `/tmp/config`
2. run `nixos-generate-config --root /tmp/config --no-filesystems`
3. copy relevant bits of the generated config to the cloned files
4. run `disko` like this:

   ```bash
   sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/config/config/disko-configuration.nix
   ```

5. fix it in the likely event it breaks the first time, then continue
6. move the now heavily-modified configs to `/mnt/etc/nixos`
7. try to run something like `nixos-install --flake /mnt/etc/nixos#zowhere-mini`
8. this *will* break, probably the first several times
9. maybe start over with `disko-install` like above with the fixes
10. try again tomorrow, it'll work eventually probably :3
