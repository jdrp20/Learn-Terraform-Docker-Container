resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "jony-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_association" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_windows_virtual_machine" "main" {
  name                  = "jony-vm"
  admin_username        = var.vm_username
  admin_password        = var.vm_password
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_B1s"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}
