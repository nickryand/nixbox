{ modulesPath, ... }:
{
  imports = [
    "${toString modulesPath}/profiles/qemu-guest.nix"
  ];

  # Vagrant qemu mounts are done via nfs-client. The nfs server
  # services provides the necessary rpc.statd service needed
  # by the client.
  services.nfs.server.enable = true;
}
