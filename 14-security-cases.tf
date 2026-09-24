# Host-confusion and scheme-smuggling inputs. These are the exact payloads
# asserted in the linker's unit tests. All must be rejected as link targets.
# Note the doubled backslashes: HCL unescapes them, so the classifier sees
# a single backslash.

module "javascript_scheme" {
  source = "javascript:x.terraform.io/foo,alert(document.domain)"
}

module "decimal_ip_backslash" {
  source = "3325256838\\a.terraform.io/path"
}

module "userinfo_smuggling" {
  source = "user@a.terraform.io/path"
}

# This one resolves to the REAL terraform.io host and must stay accepted.
module "backslash_no_confusion" {
  source = "a.terraform.io\\@evil.com/x"
}
