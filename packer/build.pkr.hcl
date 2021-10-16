build {
  name = "provisioners"

  sources = [
    "source.azure-arm.image"
  ]

  # carry out deprovisioning steps: https://www.packer.io/docs/builders/azure/arm#linux
  # for information on the Azure Linux Guest Agent, see https://github.com/Azure/WALinuxAgent
  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"

    inline = [
      "/usr/sbin/waagent -force -deprovision+user",
      "sync"
    ]

    inline_shebang = "/bin/sh -x"
  }
}
