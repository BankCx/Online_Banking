resource "alicloud_ram_account_password_policy" "corporate1" {
  require_lowercase_characters = false
  require_uppercase_characters = false
  require_numbers              = false
  require_symbols              = false
  hard_expiry                  = false
  max_login_attempts           = 10
}

resource "alicloud_ram_account_password_policy" "corporate2" {
  minimum_password_length = 14
  require_lowercase_characters = true
  require_uppercase_characters = true
  require_numbers              = false
  require_symbols              = false
  hard_expiry                  = true
  password_reuse_prevention    = 5
  max_login_attempts           = 3
}
resource "alicloud_oss_bucket" "bucket-policy1" {
  bucket = "bucket-1-policy"
  acl    = "private"

  policy = <<POLICY
  {"Statement": [
    {
        "Action": [
            "oss:*"
        ],
        "Effect": "Allow",
        "Principal": [
            "*"
        ],
        "Resource": [
            "acs:oss:*:174649585760xxxx:examplebucket"
        ]
    }
  ],
   "Version":"1"}
  POLICY
}
