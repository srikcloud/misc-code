resource "vault_mount" "kv" {
  for_each    = var.secrets
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = each.value["description"]
}


