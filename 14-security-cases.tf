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

# Userinfo spoofing. These read as one host and resolve to another. The
# rendered link text is the module name, so it can look benign.

module "userinfo_spoof_schemeless" {
  source = "a.terraform.io@evil.com/x"
}

module "userinfo_spoof_https" {
  source = "https://a.terraform.io@evil.com/x"
}

# The forced type form is worse: rebuilding the url drops the userinfo, so the
# result carries no @ at all and reads like an ordinary path.
module "userinfo_spoof_forced_git" {
  source = "git::https://github.com@evil.com/a/b.git"
}
