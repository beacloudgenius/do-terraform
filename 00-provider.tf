provider "digitalocean" {
  version = "~> 1.11"
  token   = var.do_token
}

provider "local" {
  version = "~> 1.4"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}

provider "external" {
  version = "~> 1.2"
}

# Configure the Cloudflare provider
provider "cloudflare" {
  email   = var.cloudflare_email
  token   = var.cloudflare_token
  version = "~> 1.18"
}
